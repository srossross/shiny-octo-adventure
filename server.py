
from flask import Flask, request, jsonify
from crossdomain import crossdomain

app = Flask(__name__)


@app.route('/')
def index():
	'Simple test to see if the server is working'
	return 'Your server is working'

@app.route('/data.json')
@crossdomain(origin='*')
def data():
	'some synthetic data is returned'

	# request.args are the arguements passed to a url after the '?'
	# or the 'data' argument to jquery.ajax
	data = {'echo': request.args.get('echo_me')}
	return jsonify(data)


def main():
	#Run 'server' 
	app.run(debug=True)


if __name__ == '__main__':
	main()
