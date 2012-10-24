SELECT t.name, cv.name, result.status, result.comment
FROM execution_run as run
	INNER JOIN moztrap_mozilla_org.execution_runcaseversion as rcv on rcv.run_id = run.id
	INNER JOIN moztrap_mozilla_org.library_caseversion as cv on rcv.caseversion_id = cv.id
	INNER JOIN moztrap_mozilla_org.execution_result as result on result.runcaseversion_id = rcv.id
	INNER JOIN moztrap_mozilla_org.library_caseversion_tags as cvt on cvt.caseversion_id = cv.id
	LEFT OUTER JOIN moztrap_mozilla_org.tags_tag as t on t.id = cvt.tag_id
WHERE cv.productversion_id=35 
	AND result.is_latest=true
	AND t.name REGEXP '[A-Za-z]+-[0-9]+'
ORDER BY t.name;