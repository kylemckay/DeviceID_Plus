when ASM_REQUEST_DONE
 {
        if { [ASM::status] equals "alarmed" or [ASM::status] equals "blocked" } { 
            set viodata [ASM::violation_data]
            set clientIP [ASM::client_ip]
            if {[HTTP::cookie exists "_imp_apg_r_"]} {
                set DID [HTTP::cookie _imp_apg_r_]
                set deviceid [URI::decode $DID]
                set deviceida [lindex [regexp -inline -- (?:"diA":")(.*?)(?:") $deviceid] 1]
                set deviceidb [lindex [regexp -inline -- (?:"diB":")(.*?)(?:") $deviceid] 1]
                log local0.debug "WAF Action: [lindex $viodata 6] -  Violation=[lindex $viodata 0] , Client IP=[lindex $viodata 4] , DID_A=$deviceida , DID_B=$deviceidb"
            }
            else { log local0.debug "No DeviceID found for Violation=[lindex $viodata 0] , Client IP=[lindex $viodata 4] this is either an initial request from the client or the client is not accepting cookies"
            }
        }
}
