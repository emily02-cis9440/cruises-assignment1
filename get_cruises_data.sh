#!/bin/bash
# Script: get_cruises_data.sh
# Reproducible data sourcing for the Cruises project (Assignment 1)

# Stop on first error
set -e

# ---- Parameters (adjust ONLY if your names are different) ----
MY_BUCKET="bucket1-cruises"          # your bucket name
INSTANCE="cruises-assignment-1"      # your Cloud SQL instance name
DATABASE="cruises_db"                # database name
TABLE="cruises_raw"                  # table that holds the raw CSV

echo "Importing cruises.csv from gs://${MY_BUCKET}/cruises.csv into ${DATABASE}.${TABLE}..."

gcloud sql import csv "$INSTANCE" \
  "gs://${MY_BUCKET}/cruises.csv" \
  --database="$DATABASE" \
  --table="$TABLE" \
  --quiet

echo "Done. Data loaded into ${DATABASE}.${TABLE} on instance ${INSTANCE}."
