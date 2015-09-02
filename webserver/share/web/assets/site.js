// centering the element vertically and horizontally
jQuery.fn.center = function() {
    this.css("position", "absolute");
    this.css("top", Math.max(0,
        (($(window).height() - $(this).outerHeight()) / 2) +
            $(window).scrollTop()) + "px");
    this.css("left", Math.max(0,
        (($(window).width() - $(this).outerWidth()) / 2) +
            $(window).scrollLeft()) + "px");
    return this;
};

var editor = {
    ace: undefined,
    file: undefined,
    withGraphPlan: false,
    init: function() {
        $(window).resize(editor.resize);
        editor.ace = ace.edit("editor");
        editor.ace.setTheme("ace/theme/twilight");
        editor.ace.setFontSize(12);
        editor.ace.getSession().setMode("ace/mode/javascript")
        editor.ace.getSession().setUseWorker(false);
        editor.clear();
        editor.resize();
    },
    clear: function() {
        editor.file = undefined;
        editor.ace.setValue("");
        editor.ace.setReadOnly(true);
    },
    resize: function() {
        var h = editorHeight = $(window).height() - $('.menu').outerHeight();
        var graphHeight = 0;
        if (editor.withGraphPlan) {
            editorHeight = (h*3/5).toFixed(0);
            graphHeight = h - editorHeight;
        }
        $("#editor").css("height", editorHeight + "px");
        editor.ace.resize(true);
        $('#plangraph').css("height", graphHeight + "px");
    },
    setValue: function(value, withGraphPlan) {
        editor.withGraphPlan = withGraphPlan;
        editor.ace.setValue(value);
        editor.ace.clearSelection();
        editor.ace.moveCursorTo(0, 0);
        editor.ace.focus();
        editor.ace.setReadOnly(false);
        editor.resize();
    },
    loadFile: function(file) {
        if (file === undefined) return;
        user.get("/api/v1/user/file", { name: file }, function(res) {
            if (typeof res.content === 'string') {
                // set file's name
                editor.file = file;
                // set editor content
                editor.setValue(res.content);
            } else {
                alert("[err101] Cannot get content of file " + file + ".");
            }
        }, function(res) {
            alert("[err102] Cannot get content of file " + file + ".");
        });
    },
    saveFile: function(callback) {
        if (typeof editor.file !== 'string') {
            callback();
        } else {
            var url = "/api/v1/user/file";
            var data = { name: editor.file, content: editor.ace.getValue() };
            user.post(url, data, callback, function(res) {
                alert("[err103] Cannot save file.");
            });
        }
    },
    deleteFile: function() {
        if (typeof editor.file !== 'string')
            return;
        var url = "/api/v1/user/file";
        var data = { name: editor.file };
        user.del(url, data, function() {
            files.update(function() {
                editor.clear();
            });
        }, function(res) {
            alert("[err104] Cannot delete the file.");
        });
    },
    newFile: function() {
        user.get("/api/v1/user/file", {}, function(res) {
            if (typeof res !== 'object' || typeof res.files !== 'object' &&
                    res.files.length === undefined) {
                alert("[err105] Cannot get the list of files.");
                return;
            }
            // detemine the new file's name
            var file = null;
            for (i = 0; file == null; i++) {
                file = "newfile" + i + ".nuri";
                for (j = 0; j < res.files.length; j++) {
                    if (res.files[j] == file) {
                        file = null;
                        break;
                    }
                }
            }
            // store the new file (with an empty content)
            url = "/api/v1/user/file";
            data = { name: file, content: "" }
            user.post(url, data, function(res) {
                files.update(function() {
                    files.select(file);
                });
            }, function(res) {
                alert("[err106] Cannot create a new file.");
            });
        }, function(res) {
            alert("[err107] Cannot create a new file.");
        });
    },
    renameFile: function() {
        if (typeof editor.file !== 'string')
            return;
        var name = prompt("Rename file to:");
        if (name.match(/^.+$/)) {
            var url = "/api/v1/user/file";
            var data = { name: name, content: editor.ace.getValue() };
            user.post(url, data, function(res) {
                user.del(url, { name: editor.file }, function() {
                    editor.clear();
                    files.update(function() {
                        files.select(name);
                    });
                }, function(res) {
                    alert("[err108] Cannot rename the file.");
                });
            }, function(res) {
                alert("[err109] Cannot rename the file.");
            });
        }
    }
};

var files = {
    init: function() {
        $(window).resize(files.resize);
        files.resize();
    },
    resize: function() {
        /*var offset = $(".menu").outerHeight() + $(".left-menu").outerHeight() + 1 +
            $(".problem-list").outerHeight() + 1;
        $(".file-list").css("height", ($(window).height() - offset) + "px");*/
    },
    unselect: function() {
        $(".file-list > ul > li").removeClass('file-selected');
        editor.clear();
    },
    update: function(callback) {
        if (user.id === undefined || user.id == null)
            return;
        user.get("/api/v1/user/file", {}, function(res) {
            if (typeof res === 'object' && typeof res.files === 'object' &&
                    res.files.length !== undefined) {
                files.clear();
                res.files.sort();
                for (i = 0; i < res.files.length; i++) {
                    cssClass = (res.files[i] != editor.file ? "" : 'class="file-selected"');
                    $(".file-list > ul").append("<li " + cssClass + ">" + res.files[i] + "</li>");
                }
                $(".file-list > ul > li").click(function(e) {
                    files.select($(e.target).text());
                });
                if (typeof callback === 'function')
                    callback();
            } else {
                alert("[err201] Invalid server response.");
            }
        }, function(res) {
            alert("[err202] Cannot retreive file list.");
        });
    },
    clear: function() {
        $(".file-list > ul").html("");
    },
    select: function(file) {
        var selectFile = function(res) {
            problems.unselect();
            $(".file-list > ul > li").removeClass();
            $(".file-list > ul > li").each(function(index) {
                if ($(this).text() == file) {
                    $(this).addClass("file-selected");
                    editor.loadFile(file);
                }
            });
        };
        if (typeof editor.file === 'string') {
            editor.saveFile(selectFile);
        } else {
            selectFile();
        }
    }
};

var loginPopup = {
    init: function() {
        $(window).resize(loginPopup.resize);
        loginPopup.resize();
        $(".login > button").click(user.signin);
    },
    show: function() {
        $(".popup-block").show();
        $(".popup.login").center().show();
    },
    hide: function() {
        $(".popup.login").hide();
        $(".popup-block").hide();
    },
    resize: function() {
        $(".popup-block").css("height", $(window).height());
        $(".popup-block").css("width", $(window).width());
        $(".popup.login").center();
    }
};

var user = {
    id: null,
    token: null,
    password: null, // save in memory only
    init: function() {
        if (typeof(Storage) !== "undefined") {
            var id = localStorage.getItem("client_id"),
                token = localStorage.getItem("client_token");
            if (id === 'null') id = null;
            if (token === 'null') token = null;
            user.initializeUserData({ id: id, token: token });
        }
        if (user.token === undefined || user.token === null) {
            loginPopup.show();
        }
    },
    initializeUserData: function(options) {
        if (typeof options === 'object') {
            if (typeof options.id === 'string')
                user.id = options.id;
            if (typeof options.password === 'string')
                user.password = options.password;
            if (typeof options.token === 'string')
                user.token = options.token;
        }
        if (typeof Storage !== 'undefined') {
            localStorage.setItem('client_id', user.id);
            localStorage.setItem('client_token', user.token);
        }
        files.update();
        problems.update();
    },
    clearUserData: function() {
        if (typeof Storage !== 'undefined') {
            localStorage.removeItem("client_id");
            localStorage.removeItem("client_token");
        }
        files.clear();
        editor.clear();
        user.id = user.password = user.token = undefined;
    },
    authorize: function(options) {
        $.get("/api/v1/user/authorize?client_id=" + options.username +
                "&client_password=" + options.password,
            function(data) {
                if (data !== undefined && data.token !== undefined) {
                    user.initializeUserData({
                        id: options.username,
                        password: options.password,
                        token: data.token
                    });
                    options.success(data);
                } else {
                    options.fail(data);
                }
            }
        ).fail(options.fail);
    },
    signin: function() {
        user.authorize({
            username: $(".login > input[name='username']").val(),
            password: $(".login > input[name='password']").val(),
            success: function(data) {
                loginPopup.hide();
                $(".login > input[name='username']").val("");
                $(".login > input[name='password']").val("");
            },
            fail: function(data) {
                alert("[err301] Invalid username or password.");
            }
        });
    },
    signout: function() {
        loginPopup.show();
        user.token = undefined;
        user.clearUserData();
    },
    toUrl: function(url, data) {
        url += "?client_id=" + user.id + "&client_token=" + user.token;
        if (typeof data === 'object') {
            for (key in data)
                url += "&" + key + "=" + data[key];
        }
        return url;
    },
    ping: function(success, fail) {
        var doSignout = function(x) {
            if (user.id) {
                alert("Your session has expired. You have to re-signing.");
            }
            user.signout();
        };
        if (user.id) {
            $.get(user.toUrl("/api/v1/user/ping"), success).fail(function(res) {
                if (typeof res === 'object' && res.status == 403) {
                    if (typeof user.id === 'string' && typeof user.password === 'string') {
                        user.authorize({
                            username: user.id,
                            password: user.password,
                            success: success,
                            fail: doSignout
                        });
                    } else {
                        doSignout();
                    }
                } else {
                    fail(res);
                }
            });
        }
    },
    get: function(url, data, success, fail) {
        user.ping(function(res) {
            $.get(user.toUrl(url, data), success).fail(fail);
        }, fail);
    },
    post: function(url, data, success, fail) {
        user.ping(function(res) {
            data.client_id = user.id;
            data.client_token = user.token;
            $.post(user.toUrl(url, {}), data, success).fail(fail);
        }, fail);
    },
    del: function(url, data, success, fail) {
        user.ping(function(res) {
            $.ajax({
                url: user.toUrl(url, data),
                type: "DELETE",
                success: success
            }).fail(fail);
        }, fail);
    }
};

var problems = {
    unselect: function() {
        $(".problem-list > ul > li").removeClass('problem-selected');
    },
    update: function() {
        user.get("/api/v1/user/plan", {}, function(res) {
            $(".problem-list > ul").html("");
            for (var i = 0; i < res.problems.length; i++) {
                $(".problem-list > ul").append('<li>' + res.problems[i] + '</li>');
            }
            $(".problem-list > ul > li").click(function(e) {
                files.unselect();
                problems.unselect();
                var id = $(e.target).text();
                $(e.target).addClass('problem-selected');
                user.get("/api/v1/user/plan", { problem_id: id }, function(res) {
                    if (res == '202') {
                        alert("The planner has not finished.");
                    } else {
                        user.plan = res.plan;
                        var plan = JSON.stringify(res.plan, undefined, 2);
                        editor.setValue(plan, true);
                        user.get('/api/v1/user/plangraph', { problem_id: id }, function(res) {
                            $('#graph').html(res['graph']);
                            $('title').remove();
                            $('#graph svg g .node').click(function() {
                                var id = $(this).attr('id');
                                alert(JSON.stringify(user.plan['actions'][id]));
                            });
                        }, function(res) { });
                    }
                }, function(res) {
                    if (res.status == 400) {
                        alert("[err400] Invalid problem ID.");
                    } else if (res.status == 404) {
                        alert("[err404] The solution plan is not found.");
                    } else {
                        alert("[err" + res.status + "] Internal error.");
                    }
                });
            });
        }, function(res) {
            //alert("[err401] Cannot update problems list.");
        });
    }
};



var api = {
    plan: function(success, fail) {
        user.post("/api/v1/user/plan", {}, function(res) {
            alert("Planning Problem ID: " + res.problem_id);
            if (typeof success === 'function') {
                success(res);
            }
            problems.update();
        }, fail);
    }
};

$(function() {
    editor.init();
    files.init();
    loginPopup.init();
    user.init();
});
