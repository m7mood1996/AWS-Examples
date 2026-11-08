# Ruby S3 Example

This script creates an Amazon S3 bucket in `eu-north-1`, writes a random
number of small text files containing UUIDs to `/tmp`, and uploads them to
the bucket.

## Requirements

- Ruby and Bundler installed in your environment.
- AWS credentials configured for the AWS SDK for Ruby. The SDK uses its
  standard credential provider chain, such as environment variables, a shared
  AWS profile, or an attached role.
- AWS permissions to create a bucket and upload objects.

On Ubuntu/WSL, native gem dependencies may require Ruby headers and a compiler:

```bash
sudo apt update
sudo apt install ruby3.3-dev build-essential
```

From this directory, install the dependencies:

```bash
bundle install
```

If you install gems outside the Windows-mounted project directory, set
`BUNDLE_PATH` for both installation and execution:

```bash
export BUNDLE_PATH="$HOME/.local/share/bundle"
bundle install
```

## Configure and run

Set `BUCKET_NAME` to a globally unique, valid S3 bucket name. The script does
not validate this value before calling AWS.

```bash
export BUCKET_NAME="your-unique-bucket-name"
bundle exec ruby s3.rb
```

The script uses the `eu-north-1` region. AWS SDK credentials must be available
to the process; for example, you can configure a shared AWS profile and select
it with `AWS_PROFILE`.

## What it does

1. Reads the bucket name from `BUCKET_NAME`.
2. Requests creation of that bucket in `eu-north-1`.
3. Chooses a random count from one through six.
4. Creates `file_0.txt`, `file_1.txt`, and so on under `/tmp`. Each file
   contains a UUID.
5. Uploads each file to the bucket using the same filename as its S3 object key.

The script does not delete the bucket or uploaded objects, and it leaves the
temporary files in `/tmp`. Bucket names must be globally unique, so a name
already in use will cause the create-bucket request to fail.
