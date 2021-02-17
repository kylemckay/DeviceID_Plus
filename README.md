# DeviceID_Plus
Code for various Shape DeviceID+ Use-cases

RATE_LIMIT
- Simple functionality similar to ASM/Adv.WAF Session tracking based on violations but instead using Shape Device ID+ for Device correlation
- Currently only uses the Device-based identifier and not the residue-identifier for tracking
- Maintains a subtable for each DeviceID


WAF_BLOCK_LOGGING
- Simple iRule to better correlate ASM/Adv.WAF violations with the Shape DeviceID+ value
- By using this iRule, a Security Operations team can better correlate attacker activity across their various web properties
- Currenty logs to local ONLY, can easily modify this to send to a high speed logging destination instead


Code is provided AS-IS. No warranty is implied.
