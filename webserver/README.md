# Nuri Planner as a Service

Author: Herry ([herry13@gmail.com](mailto:herry13@gmail.com))

This project aims to provide a RESTful API for the Nuri planner.


### Submitting a planner problem

- Request
	- HTTP POST /planner
	- JSON Data in HTTP body
		- SFP string : `{"type": "string", "initial": "...", "goal": "..."}`
		- SFP JSON   : `{"type": "json", "initial": {...}, "goal": {...} }`
- Response
	- `HTTP 201 Accepted` + a JSON message `{"problem-id": <problem-id>}`
	- `HTTP 500 Internal Server Error` + a JSON message `{"message": "<error-message>"}`
	- `HTTP 400 Bad Request` + a JSON message `{"message":"<error-message>"}`

Using **Curl** to submit a problem:

	curl -i -X POST -H "Content-Type: application/json" -d '{"type":"sfp","initial":"<sfp-initial-state>","goal":"<sfp-goal-state>"}' http://nurilabs.com/planner

The above should produce an output:

	{"problem-id":1164731410548706729}

where `1164731410548706729` is a random problem ID which can be used to query the solution plan as well as delete the problem.


### Querying the solution of a planning problem

- Request
	- `HTTP GET /planner/<problem-id>`
- Response
	- `HTTP 200 OK` + a JSON plan
		- `{"plan": {...}}` : solution plan is found
		- `{"plan": null}` : solution plan is not found
		- `{"plan": "timeout"}` : the planning process was timeout
	- `HTTP 202 Accepted` (planning has not been finished)
	- `HTTP 400` : invalid request
	- `HTTP 404 Not Found` : the problem with given ID is not exists
	- `HTTP 500 Internal Server Error`

### Delete a planner problem (with its solution)

- Request
	- `HTTP DELETE /planner/<problem-id>`
- Response
	- `HTTP 200 OK` : the problem has been deleted
	- `HTTP 404 Not Found` : the problem with given ID is not exists
	- `HTTP 500 Internal Server Error`

For example, we invoke the following **Curl** command to delete the problem:

	curl -i -X DELETE http://nurilabs.com/planner/1164731410548706729


### Status of Problem

1. submitted
2. invalid-problem
3. on-planning
4. no-solution
5. timeout


### LICENSE

[Apache License version 2.0](LICENSE)
