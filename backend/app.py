"""
CyberHunt Flask application factory.

Run locally:
    export FLASK_APP=backend.app:create_app
    flask run
or:
    python -m backend.app
"""

import os

from dotenv import load_dotenv
from flask import Flask, g, jsonify
from flask_cors import CORS

from database.models import db
import database.auth_models  # noqa: F401  (registers VerifiedStudent with SQLAlchemy)
from backend.auth import auth_bp
from backend.security import token_required

load_dotenv()

def create_app(config_overrides=None):
    app = Flask(__name__)

    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get(
        "DATABASE_URL", "postgresql://postgres:postgres@localhost:5432/cyberhunt"
    )
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    # In production this MUST come from the environment - a hardcoded secret
    # means anyone can forge a token for any user.
    app.config["JWT_SECRET_KEY"] = os.environ.get("JWT_SECRET_KEY", "dev-only-change-me")
    app.config["JWT_EXPIRES_HOURS"] = int(os.environ.get("JWT_EXPIRES_HOURS", 12))

    if config_overrides:
        app.config.update(config_overrides)

    db.init_app(app)
    # Allow the frontend origin to call the API and send the Authorization header.
    CORS(app, resources={r"/api/*": {"origins": os.environ.get("CORS_ORIGINS", "*")}})

    app.register_blueprint(auth_bp)

    @app.route("/api/health")
    def health():
        return jsonify({"status": "ok"}), 200

    # Example of a protected route - this is how challenges/submissions
    # endpoints will identify the participant.
    @app.route("/api/dashboard")
    @token_required
    def dashboard():
        return jsonify({
            "message": f"Welcome back, {g.current_user.username}!",
            "user_id": g.current_user.id,
            "role": g.current_user.role,
        }), 200

    return app


if __name__ == "__main__":
    create_app().run(debug=True, port=5000)
