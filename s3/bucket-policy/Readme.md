

## Create a new bucket

```sh
aws s3 mb s3://policy-example-mq-123

```

## Turn off Block Public access for ACLs


```sh
aws s3api put-bucket-policy \
    --bucket policy-example-mq-123 \
    --policy file://policy.json


aws s3api get-bucket-policy --bucket acl-example-mq-123 
```


## Remove bucket

```sh
aws s3 rb s3://acl-example-mq-123

```