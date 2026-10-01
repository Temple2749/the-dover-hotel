<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasColumn('ht_bookings', 'payment_receipt')) {
            Schema::table('ht_bookings', function (Blueprint $table) {
                $table->string('payment_receipt')->nullable();
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('ht_bookings', 'payment_receipt')) {
            Schema::table('ht_bookings', function (Blueprint $table) {
                $table->dropColumn('payment_receipt');
            });
        }
    }
};