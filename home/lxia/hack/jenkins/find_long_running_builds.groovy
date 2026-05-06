final HOURS = 8
final _hours_ago = java.util.Date.from(java.time.Instant.now().minusSeconds(HOURS * 3600))

println "Current time: ${new java.util.Date()}"
println "${HOURS} hours ago was ${_hours_ago}\n"

Jenkins.instance.computers
    *.executors
    .flatten()
    .findAll { it.busy }
    *.currentExecutable
    *.parentExecutable
    .findAll { it.time.before(_hours_ago) }
    .each { println "${it}\tstarted at ${it.time}" }

/*
    Example output,
        Current time: Fri Mar 28 06:49:43 UTC 2025
        8 hours ago was Thu Mar 27 22:49:43 UTC 2025

        ocp-upgrade/upgrade-pipeline #64139	started at Thu Mar 27 21:17:52 UTC 2025
        Result: [ocp-upgrade/upgrade-pipeline #64139]
*/
