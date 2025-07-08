from flask import request, jsonify, g
from functools import wraps
from utilities.auth_utils import verify_token

def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth_header = request.headers.get('Authorization', '')
        token = None

        if auth_header.startswith('Bearer '):
            token = auth_header[7:]

        if not token:
            return jsonify(error="Missing token"), 401
        
        user_id = verify_token(token)

        if not user_id:
            return jsonify(error="Invalid or expired token"), 401
        
        g.user_id = user_id

        return f(*args, **kwargs)

    return decorated