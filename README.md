# AWS Examples

Hands-on AWS examples I built while studying for AWS certifications. Each folder is a small example you can run yourself with the AWS CLI, an SDK, or an infrastructure-as-code tool.

## Examples

### Amazon S3

| Example | What it shows | Tools |
| --- | --- | --- |
| [bash-scripts](s3/bash-scripts/) | Create, list, sync and delete buckets and objects | AWS CLI, Bash |
| [acls](s3/acls/Readme.md) | Give another AWS account control of a bucket with ACLs | AWS CLI |
| [bucket-policy](s3/bucket-policy/Readme.md) | Grant access to a bucket with a bucket policy | AWS CLI |
| [checksums](s3/checksums/Readme.md) | Check object integrity with MD5, SHA-1 and S3 checksums | AWS CLI, Ruby |
| [etags](s3/etags/) | Upload an object with an ETag so changes are detected | Terraform |
| [sdk/ruby](s3/sdk/ruby/README.md) | Create a bucket and upload files from code | AWS SDK for Ruby |
| [iac/cfn](s3/iac/cfn/) | Deploy a bucket with a CloudFormation template | CloudFormation |
| [iac/terraform](s3/iac/terraform/) | Deploy a bucket with Terraform | Terraform |
| [iac/cdk](s3/iac/cdk/README.md) | Deploy a bucket with the AWS CDK | CDK, TypeScript |

## Prerequisites

- An AWS account and the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), configured with `aws configure`
- Whatever each example uses: Ruby and Bundler, Terraform, or Node.js for the CDK

Most examples use the `eu-north-1` region. Change it in the scripts if you work in another region.

## Before you run anything

- **These examples create real AWS resources, which can cost money.** Each example ends with cleanup steps. Run them when you're done.
- S3 bucket names are globally unique, so replace the example bucket names with your own.
- Never commit credentials, `.env` files or Terraform state. The [.gitignore](.gitignore) already excludes them.
