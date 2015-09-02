# Nuri Planner as a Service

The Nuri planner is available as a service which can be accessed using an HTTP
POST, GET, or DELETE request.

All requests should use the following service endpoint:

```
https://nurilabs.com/api/v1/planner
```

You can use/create any program to make the HTTP request. However, we will give
examples using `curl` command.



## POST Method

POST method is used to submit a planning problem which will be solved by the
Nuri planner. Each request should send:
- the type of the specifications
- the initial state
- the goal state
- other imported/included files

```bash
curl -i -X POST https://nurilabs.com/api/v1/planner \
  -d type=nuri \
  --data-urlencode initial@initial-state.nuri \
  --data-urlencode goal@goal-state.nuri
```

Assume file `initial-state.nuri` contains the specification of initial state,
and file `goal-state.nuri` contains the specification of goal state. Then the
above curl command should be used to submit a planning problem to the
service. Note that we should define the type of our specification i.e.
`type=nuri`, which means that the specifications are specified in the Nuri
language.

If the specifications are importing/including other files, then we should
include these files in the curl command.

For example, our initial and goal specifications have the following statement:

```java
import "schemas";

...
...
```

The above means that the specifications are importing file `schemas.nuri`.
Thus, we should use the filename (without extension) as the key, and use the
content of the file as the value.

```bash
curl -i -X POST https://nurilabs.com/api/v1/planner \
  -d type=nuri \
  --data-urlencode initial@initial-state.nuri \
  --data-urlencode goal@goal-state.nuri \
  --data-urlencode schemas@schemas.nuri
```


There are two possible response codes for POST request i.e.:

- `201` : this means that the problem has been received and being processed,
    and you will receive the following data: 

    ```json
    {
      "problem-id": "11aa22bb",
      "message": "The problem was created."
    }
    ```

    The above data has key `problem-id` whose value is the identifier of your
    problem. This identifier should be used to retrieve the planning result.


- `500` : there is an internal server error.



## GET Method

GET method is used to retrieve the planning result. As mentioned above, we
should use the problem's identifier in our request so that the service can
return the right answer. The response code of the request will show whether
the planner can or cannot find the solution plan of your problem. If the
solution plan can be found, then it will be returned in JSON.

A common URL of the GET request is
    `https://nurilabs.com/api/v1/planner/<problem-id>`

Assume that your problem's identifier is `11aa22bb`, then the following curl
command will send a GET request to retrieve the planning result:

```bash
curl -i https://nurilabs.com/api/v1/planner/11aa22bb
```

There are several possible response codes:
- `400` or `405` : you have given an invalid problem's identifier.
- `404` : the planner cannot find the solution plan of your problem. This has
    several meanings:
    - the problem is unsolvable
    - the planner is timeout or running out of memory

    Note that due to a limited resource of our server, the planner is only
    given 20 minutes and maximum 512 MB of memory to solve a planning problem.

- `202` : the planning has not completed because either the problem is still in
    in queue, or the planner is still finding the solution.

- `200` : the planner can find the solution plan, which will be return in JSON.
    This [link](https://github.com/nurilabs/nuri-lang#solution-plan) gives
    an explanation about the JSON format of the plan.



## DELETE Method

DELETE method is used to delete a submitted planning problem and its solution
plan (if exist). The problem's identifier should be used in the request to
determine which problem that should be deleted. This request will return a code
that indicates whether the problem (and its plan) has been deleted or not.

A common URL of the DELETE request is
    `https://nurilabs.com/api/v1/planner/<problem-id>`

Assume that your problem's identifier is `11aa22bb`, then the following curl
command will send a DELETE request to delete the planning problem:

```bash
curl -i -X DELETE https://nurilabs.com/api/v1/planner/11aa22bb
```

There are several possible response codes:
- `404` : you have given an invalid problem's identifier.
- `200` : the problem has been deleted.


## Question

If you have any question, please send an email to:
    [herry13@gmail.com](mailto: herry13@gmail.com)
