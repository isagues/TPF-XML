
declare variable $threshold as xs:integer external;

for $u in doc("sources/users2.xml")/users/row[@Reputation > $threshold]
    order by $u/@Reputation descending
    return
                        <user Id="{$u/@Id/string()}">
                            <name>{$u/@DisplayName/string()}</name>
                            <location>{$u/@Location/string()}</location>
                            <reputation>{xs:integer($u/@Reputation)}</reputation>
                            <upVotes>{xs:integer($u/@UpVotes)}</upVotes>
                            <downVotes>{xs:integer($u/@DownVotes)}</downVotes>
                        </user>