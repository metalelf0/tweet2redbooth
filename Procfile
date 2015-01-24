web: bundle exec thin start -p $PORT
worker: QUEUE=* rake resque:work
