


(for $p in doc("sources/Posts.xml")/posts/row[51 = @OwnerUserId and @Score = max(//row[51 = @OwnerUserId]/@Score)]
        order by xs:dateTime($p/@CreationDate)
        return $p)[1]/@Body/string()