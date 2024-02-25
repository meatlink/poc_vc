from bottle import request, route, run, template
from os import environ
import logging


@route("/foo")
def foo():
    logging.warning("request" + str(request.query))
    for k, v in request.query.items():
        logging.warning(f"- {k} = {v}")
    return dict(request.query)


run(
    host="0.0.0.0",
    port=environ.get("APP_PORT", 8080),
    debug=True,
)
