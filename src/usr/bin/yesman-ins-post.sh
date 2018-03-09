#! /bin/bash


#local repo pkg_name ver_dest ver_src arch;
# To test the input format.
#i=0;
while read pkg_name;
do
	#echo "${i}::${pkg_name}";
	#i=$((++i));
	
	
	# Retrieve some values.
	#repo='';
	arch=$(pacman --query --info "${pkg_name}" | grep 'Architecture' - | cut --delimiter=':' --fields=2 - | xargs);
	# Because this script would only be triggered when reinstalling, downgrading, or upgrading,
	# a version is expected to always be installed.
	ver_src=$(pacman --query --info "${pkg_name}" | grep 'Version' - | cut --delimiter=':' --fields=2 - | xargs);
	ver_dest=$(pacman --sync --info "${pkg_name}" | grep 'Version' - | cut --delimiter=':' --fields=2 - | xargs);
	
	# Do not activate when reinstalling the same version.
	if test "${ver_dest}" == "${ver_src}";
	then
		continue;
	fi;
	
	# Run the first found executable file.
	
	# This package; this version; this architecture.
	if test -x "/etc/yesman/${pkg_name}-${ver_dest}-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_dest}-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_dest}-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# This package; this version; any architecture.
	elif test -x "/etc/yesman/${pkg_name}-${ver_dest}-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_dest}-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_dest}-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# This package; any version; this architecture.
	elif test -x "/etc/yesman/${pkg_name}-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# This package; any version; any architecture.
	elif test -x "/etc/yesman/${pkg_name}-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# Any package; any version; this architecture.
	if test -x "/etc/yesman/any-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# Any package; any version; any architecture.
	elif test -x "/etc/yesman/any-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	fi;
done < /dev/stdin;


#exit 1;
