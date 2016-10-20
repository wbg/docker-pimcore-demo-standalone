<?php

return [
    "backend" => [
        "type" => "\\Pimcore\\Cache\\Backend\\Redis2",
        "custom" => "true",
        "options" => [
            "server" => getenv("REDIS_HOST"),
            "port" => "6379",
            "persistent" => "1",
            "database" => "1",
            "use_lua" => "1"
        ]
    ]
];
