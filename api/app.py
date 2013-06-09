from flask import Flask, jsonify, abort, make_response, request, url_for
import oauth2 as oauth
import urllib2 as urllib

app = Flask(__name__)

# See Assignment 1 instructions or README for how to get these credentials
access_token_key = "54296117-CnKVwHHQiAmYXQ0nnnR2LRh2bPsbXYdx7AUxKPXmc"
access_token_secret = "pYq8FAo3DvRwVD0xHG0JlTzJ2pJmUg029PLwT9QQ"

consumer_key = "bRrpyEa4UWmSC3lnawB0jA"
consumer_secret = "esqmvAptNEw78JetXBlWVoElTUij9NygiiLdXXyPYk"

_debug = 0

oauth_token    = oauth.Token(key=access_token_key, secret=access_token_secret)
oauth_consumer = oauth.Consumer(key=consumer_key, secret=consumer_secret)

signature_method_hmac_sha1 = oauth.SignatureMethod_HMAC_SHA1()

http_method = "GET"


http_handler  = urllib.HTTPHandler(debuglevel=_debug)
https_handler = urllib.HTTPSHandler(debuglevel=_debug)

'''
Construct, sign, and open a twitter request
using the hard-coded credentials above.
'''
def twitterreq(url, method, parameters):
  req = oauth.Request.from_consumer_and_token(oauth_consumer,
                                             token=oauth_token,
                                             http_method=http_method,
                                             http_url=url,
                                             parameters=parameters)

  req.sign_request(signature_method_hmac_sha1, oauth_consumer, oauth_token)

  headers = req.to_header()

  if http_method == "POST":
    encoded_post_data = req.to_postdata()
  else:
    encoded_post_data = None
    url = req.to_url()

  opener = urllib.OpenerDirector()
  opener.add_handler(http_handler)
  opener.add_handler(https_handler)

  response = opener.open(url, encoded_post_data)

  return response

@app.route('/user/<int:profile>', methods = ['GET'])
def fetchsamples(profile):
  #url = "https://stream.twitter.com/1/statuses/sample.json"
  #url = "https://api.twitter.com/1.1/statuses/user_timeline.json"
  #url = "https://api.twitter.com/1.1/friends/ids.json"
  #url = "https://api.twitter.com/1.1/followers/ids.json"
  #url = "https://api.twitter.com/1.1/followers/list.json"
  url = "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id="+str(profile)
  parameters = []
  response = twitterreq(url, "GET", parameters)
  for line in response:
    return jsonify( {'data': line } )

if __name__ == '__main__':
  app.run()
