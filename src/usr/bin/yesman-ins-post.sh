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
	
	#ver_cmpd=$(vercmp "${ver_dest}" "${ver_src}");
	
	# Do not activate when reinstalling the same version.
#	if test $(vercmp "${ver_dest}" "${ver_src}") -eq 0;
	#if test ${vercmpd} -eq 0;
#	then
#		continue;
	#elif test ${vercmpd} -lt 0;
	#	direction='down';
	#elif test ${vercmpd} -gt 0;
	#	direction='up';
#	fi;
	
	# Run the first found executable file.
	
	# 1. This package; this source version; this destination version; this architecture.
	if test -x "/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 2. This package; this source version; this destination version; any architecture.
	elif test -x "/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_src}-${ver_dest}-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 3. This package; this source version; any destination version; this architecture.
	if test -x "/etc/yesman/${pkg_name}-${ver_src}-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_src}-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_src}-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 4. This package; this source version; any destination version; any architecture.
	if test -x "/etc/yesman/${pkg_name}-${ver_src}-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-${ver_src}-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-${ver_src}-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 5. This package; any source version; this destination version; this architecture.
	elif test -x "/etc/yesman/${pkg_name}-any-${ver_dest}-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-${ver_dest}-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-${ver_dest}-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 6. This package; any source version; this destination version; any architecture.
	if test -x "/etc/yesman/${pkg_name}-any-${ver_dest}-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-${ver_dest}-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-${ver_dest}-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 7. This package; any source version; any destination version; this architecture.
	if test -x "/etc/yesman/${pkg_name}-any-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 8. This package; any source version; any destination version; any architecture.
	if test -x "/etc/yesman/${pkg_name}-any-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/${pkg_name}-any-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/${pkg_name}-any-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 9. Any package; this source version; this destination version; this architecture.
	if test -x "/etc/yesman/any-${ver_src}-${ver_dest}-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-${ver_src}-${ver_dest}-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-${ver_src}-${ver_dest}-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 10. Any package; this source version; this destination version; any architecture.
	if test -x "/etc/yesman/any-${ver_src}-${ver_dest}-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-${ver_src}-${ver_dest}-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-${ver_src}-${ver_dest}-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 11. Any package; this source version; any destination version; this architecture.
	if test -x "/etc/yesman/any-${ver_src}-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-${ver_src}-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-${ver_src}-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 12. Any package; this source version; any destination version; any architecture.
	if test -x "/etc/yesman/any-${ver_src}-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-${ver_src}-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-${ver_src}-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 13. Any package; any source version; this destination version; this architecture.
	if test -x "/etc/yesman/any-any-${ver_dest}-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-${ver_dest}-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-${ver_dest}-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 14. Any package; any source version; this destination version; any architecture.
	if test -x "/etc/yesman/any-any-${ver_dest}-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-${ver_dest}-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-${ver_dest}-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 15. Any package; any source version; any destination version; this architecture.
	if test -x "/etc/yesman/any-any-any-${arch}-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-any-${arch}-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-any-${arch}-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
		error=${?};
		if test ${error} -ne 0;
		then
			echo "exit[${error}]";
			exit ${error};
		fi;
		echo "error[${error}]";
	
	# 16. Any package; any source version; any destination version; any architecture.
	elif test -x "/etc/yesman/any-any-any-any-ins-post.sh";
	then
		# Run it.
		echo -e -n "Running '""/etc/yesman/any-any-any-any-ins-post.sh ${pkg_name} ${ver_src} ${ver_dest} ${arch}""'...\n";
		"/etc/yesman/any-any-any-any-ins-post.sh" "${pkg_name}" "${ver_src}" "${ver_dest}" "${arch}";
		
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
