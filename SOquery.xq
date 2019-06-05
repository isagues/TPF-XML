declare variable $threshold as xs:integer external;
declare function local:topPost($Id as xs:integer) as xs:string
{
    (for $p in doc("sources/Posts.xml")/posts/row[$Id = @OwnerUserId and @Score = max(//row[$Id = @OwnerUserId]/@Score)]
        order by xs:dateTime($p/@CreationDate)
        return $p)[1]/@Body/string()
};

<result>{
    if (count(doc("sources/Users.xml")/users/row[@Reputation > $threshold]) eq 0)
        then <error>Users not found</error>
        else
            <users>{
                for $u in doc("sources/Users.xml")/users/row[@Reputation > $threshold]
                    order by $u/@Reputation
                    return
                        <user Id="{$u/@Id/string()}">
                            <name>{$u/@DisplayName}</name>
                            <location>{$u/@Location}</location>
                            <reputation>{$u/@Reputation}</reputation>
                            <upVotes>{$u/@upVotes}</upVotes>
                            <downVotes>{$u/@downVotes}</downVotes>
                            if(count(doc("sources/Post.xml")/posts/row[$Id = @OwnerUserId]) == 0)
                            then
                            else <top_post>{local:topPost($u/@Id)}</top_post> 
                        </user>
            }</users>
        }</result>
