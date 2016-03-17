#!/bin/bash
if [ -n "$GCLOUD_SVC_ACCOUNT" ] || [ -n "$GCLOUD_SVC_KEY" ]; then
	# Looks like we tried to pass in values. Let's authenticate.
	/usr/bin/gcloud auth activate-service-account "$GCLOUD_SVC_ACCOUNT" --key-file <(echo -e "$GCLOUD_SVC_KEY") || (echo "gcloud auth failed"; exit 1)
fi

/usr/local/bin/meyectl startserver
