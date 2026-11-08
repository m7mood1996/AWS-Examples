require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

# Set BUCKET_NAME in the environment before running this script.
bucket_name = ENV['BUCKET_NAME']
# Buckets are created in this AWS region.
region = 'eu-north-1'
puts bucket_name

# The AWS SDK loads credentials from its default credential provider chain.
client = Aws::S3::Client.new(
    #region: region_name,
    #credentials: credentials,
    # ... already set
)

# Create the bucket before uploading objects to it.
resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
        location_constraint: region
    }
})

# Generate and upload between one and six UUID text files.
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

number_of_files.times.each do |i|
    puts "i: #{i}"
    filename = "file_#{i}.txt"
    # Store a temporary local copy before uploading it to S3.
    output_path = "/tmp/#{filename}"

    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid)
    end
    # Use the filename as the S3 object key.
    File.open(output_path, "rb") do |file|
        client.put_object(
            bucket: bucket_name,
            key: filename,
            body: file
        )
    end
     
end