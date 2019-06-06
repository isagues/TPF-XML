<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="threshold" required="yes"/>
    <xsl:variable name="totalUpVotes">
        <xsl:value-of select="sum(//upVotes)"/>
    </xsl:variable>
    <xsl:template match="users">
        <xsl:result-document href="./output.html" method="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="outputStyle.css" />
                </head>
                <body>
                    <h1>Users with reputation higher than <xsl:value-of select="$threshold"/>
                    </h1>
                    <div class="UpVotes-Bar-Table">
                        <table>
                            <tr>
                                <th style="padding-right: 5%;text-align: right;">User</th>
                                <th style="padding-left: 5%;text-align: initial;">Upvote Distribution Percentage</th>
                            </tr>
                            <xsl:for-each select="user[(upVotes div $totalUpVotes ) > 0.015] ">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <svg class="UpVotes-Bars-Constructor">
                                            <xsl:element name="rect">
                                                <xsl:attribute name="width">
                                                    <xsl:value-of select=" (./upVotes div $totalUpVotes) * 400"/>
                                                    <xsl:text>%</xsl:text>
                                                </xsl:attribute>
                                                <xsl:attribute name="class">
                                                    <xsl:text>UpVotes-Bars</xsl:text>
                                                </xsl:attribute>
                                            </xsl:element>
                                        </svg>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div class="Users-Table">
                        <table>
                            <tr>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Reputation</th>
                                <th>UpVotes</th>
                                <th>DownVotes</th>
                                <th class="TopPost">TopPost</th>
                            </tr>
                            <xsl:for-each select="user">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="location"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="reputation"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="upVotes"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="downVotes"/>
                                    </td>
                                    <td class="TopPost">
                                        <xsl:value-of select="top_post"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </body>
            </html>

        </xsl:result-document>
    </xsl:template>
    <xsl:template match="error">
        <xsl:result-document href="./output.html" method="html">
            <html>
                <body>
                    <h1>Error</h1>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>