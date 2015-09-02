#include <iostream>
#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <stdio.h>

//#define LINUX
#define OSX

#ifdef OSX
#include <mach-o/dyld.h>
#endif

using namespace std;

string location ()
{
    string self = "planner";
    char buf[1024];
    ssize_t len;
#ifdef LINUX
    len = readlink("/proc/self/exe", buf, sizeof(buf));
#else
    uint32_t size = 1024;
    _NSGetExecutablePath(buf, &size);
    len = strlen(buf);
#endif
    if (len > self.length()) {
        len -= self.length() + 1;
    }
    buf[len] = '\0';
    return string(buf);
}

inline string preprocess ()
{
    return (location() + "/preprocess");
}

inline string search ()
{
    string options = "--search \"lazy_greedy(ff())\"";
    return (location() + "/search " + options);
}

inline bool file_exist (string name)
{
    struct stat buffer;
    return (stat(name.c_str(), &buffer) == 0);
}

int main (int argc, char* argv[])
{
    string file = (argc > 1 ? argv[1] : "output.sas");

    string command = preprocess() + "<" + file + " 1>/dev/null";
    if (!system(command.c_str())) {
        command = search() + "<output 1>/dev/null";
        if (system(command.c_str())) {
            exit(EXIT_FAILURE);
        }
    } else {
        exit(EXIT_FAILURE);
    }

    string output = "output";
    string sas_plan = "sas_plan";
    string solution_plan = "solution_plan";
    string plan_numbers_and_cost = "plan_numbers_and_cost";
    if (file_exist(output)) {
        remove(output.c_str());
        if (file_exist(sas_plan)) {
            rename(sas_plan.c_str(), solution_plan.c_str());
        } else {
            exit(EXIT_FAILURE);
        }
        if (file_exist(plan_numbers_and_cost)) {
            remove(plan_numbers_and_cost.c_str());
        }
    } else {
        exit(EXIT_FAILURE);
    }

    return 0;
}
