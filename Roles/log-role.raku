enum Severity <debug info warn error critical>;
 
role Logging[$filehandle = $*ERR] {
    method log(Severity $sev, $message) {
        $filehandle.print("[{uc $sev}] $message\n");
    }
}
 
Logging[$*OUT].log(error, 'here we go'); # OUTPUT: «[DEBUG] here we go␤» 