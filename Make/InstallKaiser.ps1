$filterName='KaiserFilter'

$consumerName='KaiserConsumer'

$Query="SELECT * FROM __InstanceCreationEvent WITHIN 10 WHERE TargetInstance ISA 'Win32_LoggedOnUser'"

$WMIEventFilter=Set-WmiInstance -Class __EventFilter -NameSpace "root\subscription" -Arguments @{Name=$filterName; EventNameSpace="root\cimv2"; QueryLanguage="WQL"; Query=$Query}

$WMIEventConsumer=Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments @{Name=$consumerName; CommandLineTemplate=$cmd}

Set-WmiInstance  -Class __FilterToConsumerBinding  -Namespace "root\subscription"  -Arguments @{Filter=$WMIEventFilter; Consumer=$WMIEventConsumer}