<?php

namespace Tests\Feature\Admin\Transfer;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TransferTest extends TestCase
{
    /**
     * test_transfer_view
     *
     * @return void
     */
    public function test_transfer_view()
    {
        $response = $this->get('/dashboard/transfer');

        $response->assertStatus(200);
    }
}
