<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="users">
        <xsl:result-document href="./output.html" method="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="outputStyle.css" />
                </head>
                <body>
                    <h1>Users with reputation higher than #VALUE</h1>
                    <div class="UpVotes-Bar-Table">
                        <table>
                            <tr>
                                <th style="padding-right: 5%;text-align: right;">User</th>
                                <th style="padding-left: 5%;
          text-align: initial;">
            Upvote Distribution Percentage
                                </th>
                            </tr>
                            <tr>
                                <td>PechiGod</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="80%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Faustin0 Mario Ernesto Putignano</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="15%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Tobi</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="2%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Yo</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="40%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Juan</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="35%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Martin</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="55%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>Pepe</td>
                                <td>
                                    <svg class="UpVotes-Bars-Constructor">
                                        <rect width="12%" class="UpVotes-Bars" />
                                    </svg>
                                </td>
                            </tr>
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
                            <tr>
                                <td>Tobi</td>
                                <td>Carcel de Peleles</td>
                                <td>12</td>
                                <td>3</td>
                                <td>245</td>
                                <td class="TopPost">
            On recommend tolerably my belonging or am. Mutual has cannot beauty
            indeed now sussex merely you. It possible no husbands jennings ye
            offended packages pleasant he. Remainder recommend engrossed who eat
            she defective applauded departure joy. Get dissimilar not introduced
            day her apartments. Fully as taste he mr do smile abode every.
            Luckily offered article led lasting country minutes nor old. Happen
            people things oh is oppose up parish effect. Law handsome old
            outweigh humoured far appetite.
                                </td>
                            </tr>
                            <tr>
                                <td>Faustino Mario Ernesto Pannunzio Putignano</td>
                                <td>Country</td>
                                <td>1245</td>
                                <td>333</td>
                                <td>25</td>
                                <td class="TopPost">null</td>
                            </tr>
                            <tr>
                                <td>Pechi</td>
                                <td>AvellaNegra</td>
                                <td>54!</td>
                                <td>50!</td>
                                <td>-1</td>
                                <td class="TopPost">Sacar Campeon a Racing</td>
                            </tr>
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