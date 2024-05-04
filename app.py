from flask import Flask, render_template, jsonify, request
import psycopg2

app = Flask(__name__)

# Configure PostgreSQL connection
conn = psycopg2.connect(
    dbname="realty",
    user="michaela",
    password="final07@07",
    host="localhost",
    port="5432"
)

# Define API endpoints

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/renting')
def renting():
    try:
        cur = conn.cursor()
        cur.execute("""
            SELECT p.*, r.rental_price, r.available_date
            FROM properties p
            JOIN renting r ON p.id = r.property_id
            WHERE p.category = 'renting'
        """)
        properties = cur.fetchall()
        cur.close()
        return render_template('renting.html', properties=properties)
    except psycopg2.Error as e:
        # Log the error
        app.logger.error("Database error: %s", e)
        return jsonify({'error': 'Internal Server Error'}), 500

@app.route('/buying')
def buying():
    try:
        cur = conn.cursor()
        cur.execute("""
            SELECT p.*, b.list_price, b.status
            FROM properties p
            JOIN buying b ON p.id = b.property_id
            WHERE p.category = 'buying'
        """)
        properties = cur.fetchall()
        cur.close()
        return render_template('buying.html', properties=properties)
    except psycopg2.Error as e:
        # Log the error
        app.logger.error("Database error: %s", e)
        return jsonify({'error': 'Internal Server Error'}), 500

@app.route('/agents')
def agents():
    try:
        cur = conn.cursor()
        cur.execute("SELECT * FROM agents")
        agents = cur.fetchall()
        cur.close()
        return render_template('agents.html', agents=agents)
    except psycopg2.Error as e:
        # Log the error
        app.logger.error("Database error: %s", e)
        return jsonify({'error': 'Internal Server Error'}), 500


# Route for scheduling tours
@app.route('/schedule_tour', methods=['POST'])
def schedule_tour():
    try:
        recipient_name = request.form.get('recipient_name')
        recipient_email = request.form.get('recipient_email')
        phone_number = request.form.get('phone_number')
        message = request.form.get('message')
        property_id = request.form.get('property_id')

        cur = conn.cursor()
        cur.execute("""
            INSERT INTO schedule_tour ( recipient_name, recipient_email, phone_number, message)
            VALUES (%s, %s, %s, %s)
        """, (recipient_name, recipient_email, phone_number, message))
        conn.commit()
        cur.close()

        return 'Tour scheduled successfully!'
    except psycopg2.Error as e:
        # Log the error
        app.logger.error("Database error: %s", e)
        return jsonify({'error': 'Internal Server Error'}), 500
    except Exception as e:
        # Log the error
        app.logger.error("An unexpected error occurred: %s", e)
        return jsonify({'error': 'Internal Server Error'}), 500


if __name__ == '__main__':
    app.run(debug=True)
