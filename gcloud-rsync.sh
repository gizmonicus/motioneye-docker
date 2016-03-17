#!/bin/bash
flock -xnE 0 /tmp/lock /usr/bin/gsutil -m rsync -d -r "$1" "gs://${GCLOUD_BUCKET}"
