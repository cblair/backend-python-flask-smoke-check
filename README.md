# Backend Sim

## Setup

You need a Unix-y environment (such as Linux, MacOS, or Windows Subsystem for Linux (WSL)) with:

- SQLite3 (`which sqlite3` to check). `brew install sqlite` on macOS.
- Python 3 (`which python3` to check). `brew install python` on macOS.

```
# Install app dependencies
$ ./setup.sh

# Start the server
$ ./run.sh
```

In your browser, navigate to http://localhost:8080/api/healthcheck to see if
things work. You should get back something like this:

```
$ curl http://localhost:8080/api/healthcheck
{
  "rows": [
    {
      "description": "this is a smoke check"
    },
    {
      "description": "this is another smoke check"
    }
  ]
}
```
