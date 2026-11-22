## Create a new s3 bucket

```sh
aws s3 mb s3://checksums-example-mq-123
```

## Create a file that will do a checksum on

```sh

echo "Hello Mars" > myfile.txt
```

## Get a checksum of tjhe file using md5
```sh
md5sum myfile.txt
```


## upload our file to the bucket

```sh
aws s3 cp myfile.txt s3://checksums-example-mq-123/myfile.txt

aws s3api head-object --bucket checksums-example-mq-123 --key myfile.txt
```

8ed2d86f12620cdba4c976ff6651637f
8ed2d86f12620cdba4c976ff6651637f
good


## Lets upload a file with a different kind of checksums

```sh
sha1sum myfile.txt
HEX="c28ccc2c5e214036806014df9fb43634f3e770b2"
B64=$(echo -n "$HEX" | xxd -r -p | base64)
aws s3api put-object \
    --bucket checksums-example-mq-123 \
    --key myfilecrc32.txt \
    --body myfile.txt \
    --checksum-algorithm SHA1 \
    --checksum-sha1="$B64"
```