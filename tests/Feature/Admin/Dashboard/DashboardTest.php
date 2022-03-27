<?php

namespace Tests\Feature\Admin\Dashboard;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class DashboardTest extends TestCase
{
    use RefreshDatabase;

    /**
     * test_dashboard_view
     *
     * @return void
     */
    public function test_dashboard_view()
    {
        $response = $this->get('/dashboard');

        $response->assertStatus(200);
    }
}
