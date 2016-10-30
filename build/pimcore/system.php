<?php

return [
    "general" => [
        "timezone" => "Europe/Berlin",
        "php_cli" => "",
        "domain" => "",
        "redirect_to_maindomain" => false,
        "language" => "en",
        "validLanguages" => "en,de",
        "fallbackLanguages" => [
            "en" => "",
            "de" => ""
        ],
        "extjs6" => "1",
        "theme" => "",
        "contactemail" => "",
        "loginscreencustomimage" => "",
        "disableusagestatistics" => false,
        "debug" => false,
        "debug_ip" => "",
        "http_auth" => [
            "username" => "",
            "password" => ""
        ],
        "custom_php_logfile" => true,
        "debugloglevel" => "error",
        "disable_whoops" => false,
        "debug_admin_translations" => false,
        "devmode" => false,
        "logrecipient" => null,
        "viewSuffix" => "",
        "instanceIdentifier" => "",
        "show_cookie_notice" => false
    ],
    "database" => [
        "adapter" => "Mysqli",
        "params" => [
            "host" => getenv("MYSQL_HOST"),
            "username" => getenv("MYSQL_USER"),
            "password" => getenv("MYSQL_PASSWORD"),
            "dbname" => getenv("MYSQL_DATABASE"),
            "port" => "3306"
        ]
    ],
    "documents" => [
        "versions" => [
            "days" => null,
            "steps" => 10
        ],
        "default_controller" => "default",
        "default_action" => "default",
        "error_pages" => [
            "default" => "/error"
        ],
        "createredirectwhenmoved" => false,
        "allowtrailingslash" => "no",
        "allowcapitals" => "no",
        "generatepreview" => true,
        "wkhtmltoimage" => "",
        "wkhtmltopdf" => ""
    ],
    "objects" => [
        "versions" => [
            "days" => null,
            "steps" => 10
        ]
    ],
    "assets" => [
        "versions" => [
            "days" => null,
            "steps" => 10
        ],
        "icc_rgb_profile" => "",
        "icc_cmyk_profile" => "",
        "hide_edit_image" => false
    ],
    "services" => [
        "google" => [
            "client_id" => "655439141282-tic94n6q3j7ca5c5as132sspeftu5pli.apps.googleusercontent.com",
            "email" => "655439141282-tic94n6q3j7ca5c5as132sspeftu5pli@developer.gserviceaccount.com",
            "simpleapikey" => "AIzaSyCo9Wj49hYJWW2WgOju4iMYNTvdcBxmyQ8",
            "browserapikey" => "AIzaSyBJX16kWAmUVEz1c1amzp2iKqAfumbcoQQ"
        ]
    ],
    "cache" => [
        "enabled" => false,
        "lifetime" => null,
        "excludePatterns" => "",
        "excludeCookie" => ""
    ],
    "outputfilters" => [
        "less" => false,
        "lesscpath" => ""
    ],
    "webservice" => [
        "enabled" => true
    ],
    "httpclient" => [
        "adapter" => "Zend_Http_Client_Adapter_Socket",
        "proxy_host" => "",
        "proxy_port" => "",
        "proxy_user" => "",
        "proxy_pass" => ""
    ],
    "email" => [
        "sender" => [
            "name" => "pimcore Demo",
            "email" => "pimcore-demo@byom.de"
        ],
        "return" => [
            "name" => "pimcore Demo",
            "email" => "pimcore-demo@byom.de"
        ],
        "method" => "sendmail",
        "smtp" => [
            "host" => "",
            "port" => "",
            "ssl" => "",
            "name" => "",
            "auth" => [
                "method" => "",
                "username" => "",
                "password" => ""
            ]
        ],
        "debug" => [
            "emailaddresses" => "pimcore@byom.de"
        ],
        "bounce" => [
            "type" => "",
            "maildir" => "",
            "mbox" => "",
            "imap" => [
                "host" => "",
                "port" => "",
                "username" => "",
                "password" => "",
                "ssl" => ""
            ]
        ]
    ],
    "newsletter" => [
        "sender" => [
            "name" => "",
            "email" => ""
        ],
        "return" => [
            "name" => "",
            "email" => ""
        ],
        "method" => "",
        "smtp" => [
            "host" => "",
            "port" => "",
            "ssl" => "",
            "name" => "",
            "auth" => [
                "method" => "",
                "username" => "",
                "password" => ""
            ]
        ],
        "usespecific" => ""
    ]
];
