

## Create a new bucket

```sh
aws s3 mb s3://acl-example-mq-123

```

## Turn off Block Public access for ACLs


```sh
aws s3api put-public-access-block \
    --bucket acl-example-mq-123 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"


aws s3api get-public-access-block --bucket acl-example-mq-123 
```


# change bucket Ownership
```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-mq-123 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```




# change ACLs to allow for a user in anothert AWS Account
```sh
aws s3api put-bucket-acl \
    --bucket acl-example-mq-123 \
    --access-control-policy file://policy.json
```



## Remove bucket

```sh
aws s3 rb s3://acl-example-mq-123

```