when ASM_REQUEST_DONE {
    if {[HTTP::cookie exists "_imp_apg_r_"]} {
        set did [HTTP::cookie _imp_apg_r_]
        set deviceid [URI::decode $did]
        set deviceida [lindex [regexp -inline -- (?:"diA":")(.*?)(?:") $deviceid] 1]
        set deviceidb [lindex [regexp -inline -- (?:"diB":")(.*?)(?:") $deviceid] 1]
        set clientIP [ASM::client_ip]
        set tableout [table keys -subtable $deviceidb]
        if { [table keys -subtable $deviceidb -count] >= 5 } { 
                log local0.debug "DeviceID rate limit has been exceeded by device $deviceidb"
                ASM::raise VIOLATION_DID_RATELIMIT
            }
        if { [ASM::status] equals "alarmed" or [ASM::status] equals "blocked" } {
                set did [HTTP::cookie _imp_apg_r_]
                set deviceid [URI::decode $did]
                set deviceida [lindex [regexp -inline -- (?:"diA":")(.*?)(?:") $deviceid] 1]
                set deviceidb [lindex [regexp -inline -- (?:"diB":")(.*?)(?:") $deviceid] 1]
                set clientIP [ASM::client_ip]
                table add -subtable $deviceidb [ASM::support_id] $clientIP 30 30
            }
    }
         else { log local0.debug "No DeviceID+ found" }   
}
