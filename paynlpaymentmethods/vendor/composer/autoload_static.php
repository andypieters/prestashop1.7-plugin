<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit6b58c58329851c79dd02ede5a034cbfe
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Paynl\\' => 6,
        ),
        'C' => 
        array (
            'Curl\\' => 5,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Paynl\\' => 
        array (
            0 => __DIR__ . '/..' . '/paynl/sdk/src',
        ),
        'Curl\\' => 
        array (
            0 => __DIR__ . '/..' . '/php-curl-class/php-curl-class/src/Curl',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit6b58c58329851c79dd02ede5a034cbfe::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit6b58c58329851c79dd02ede5a034cbfe::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
