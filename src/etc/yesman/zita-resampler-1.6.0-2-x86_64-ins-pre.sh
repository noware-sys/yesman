#! /bin/bash

echo "${0} ${@}";

# If required,
# run commands from the in-between versions.
#yesman-ins-pre-inter "${repo}" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}" '*';
# Or,
# a specific version.
#"${yesman_cfg_hookdir}/""${repo}-${pkg_name}-1.5.9-1-${arch}";

# Run the precommands specific for this repo/pkg-version-arch.
#rm -rf /usr/lib/libzita-resampler.so.1;

exit 2;
