#! /bin/bash

# An example.
echo "${0} ${@}";

echo -e -n '`rm -rf /usr/lib/libzita-resampler.so.1`...'"\n";
# Run the commands specific for this repo/pkg-ver->ver-arch.
rm -rf /usr/lib/libzita-resampler.so.1;

#exit 2;
