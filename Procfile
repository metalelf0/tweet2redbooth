web: bundle exec thin start -p $PORT
worker: TERM_CHILD=1 QUEUE=* rake resque:work
