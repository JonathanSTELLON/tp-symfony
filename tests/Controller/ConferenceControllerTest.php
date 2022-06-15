<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ConferenceControllerTest extends WebTestCase
{
    public static function testIndex()
    {
        $client = static::createClient();
        $client->request('GET', '/');

        static::assertResponseIsSuccessful();
        //On check si le h2 contient le message 'Give...'
        static::assertSelectorTextContains('h2', 'Give your feedback');
    }
}