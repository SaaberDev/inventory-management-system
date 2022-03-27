<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ClearTmp extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tmp:clear';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will clear media temporary folder.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        if (\Storage::disk('tmp')->exists('uploads')){
            \Storage::disk('tmp')->deleteDirectory('uploads');
            $this->info('Temporary Directory Deleted Successfully');
        } else {
            $this->error('Temporary Directory Does Not Exists');
        }
    }
}
