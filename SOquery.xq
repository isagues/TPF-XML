declare variable $threshold as xs:integer external;
declare function local:topPost($Id as xs:integer) as xs:string
{
    (for $p in doc("sources/Posts.xml")/posts/row[$Id = @OwnerUserId and @Score = max(//row[$Id = @OwnerUserId]/@Score)]
        order by xs:dateTime($p/@CreationDate) descending
        return $p)[1]/@Body/string()
};

<result xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="./sources/intermediate.xsd">{
    if (count(doc("sources/Users.xml")/users/row[@Reputation > $threshold]) = 0)
        then <error>Users not found</error>
        else
            <users>{
                for $u in doc("sources/Users.xml")/users/row[@Reputation > $threshold]
                    order by xs:long($u/@Reputation) descending
                    return
                        <user Id="{$u/@Id/string()}">
                            <name>{$u/@DisplayName/string()}</name>
                            <location>{$u/@Location/string()}</location>
                            <reputation>{xs:integer($u/@Reputation)}</reputation>
                            <upVotes>{xs:integer($u/@UpVotes)}</upVotes>
                            <downVotes>{xs:integer($u/@DownVotes)}</downVotes>
                            {if(count(doc("sources/Posts.xml")/posts/row[@OwnerUserId = $u/@Id]) = 0)
                            then ()
                            else <top_post>{local:topPost($u/@Id)}</top_post> }
                        </user>
            }</users>
        }</result>
