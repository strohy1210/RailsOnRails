incorporate price params

rack timeout gem so we have more time to make request to let us search for longer
interstitial page - a page thats in between request and response
def get_results
  redirect_to "some page" // or put js where a gif comes up or modal

  make scrape

  redirect to results
end
event listener for when the request




http://stackoverflow.com/questions/18139380/override-30-seconds-timeout-on-gem-class-timeout
start server w this:
thin --timeout 60 start

http://userprimary.net/posts/2008/04/13/setting-a-longer-timeout-for-nethttp-requests-in-ruby/