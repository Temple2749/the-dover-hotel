<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Hotel\Models\Booking;
use Botble\Hotel\Models\BookingAddress;
use Botble\Hotel\Models\BookingRoom;
use Botble\Hotel\Models\Room;
use Botble\Hotel\Models\RoomCategory;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class RoomSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('rooms');

        Room::query()->truncate();

        $rooms = [
            [
                'name' => 'Luxury Hall Of Fame',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->value('id'),
                'images' => json_encode([
                    'rooms/01.jpg',
                    'rooms/02.jpg',
                    'rooms/03.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Pendora Fame',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->value('id'),
                'images' => json_encode([
                    'rooms/02.jpg',
                    'rooms/01.jpg',
                    'rooms/03.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Pacific Room',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->value('id'),
                'images' => json_encode([
                    'rooms/03.jpg',
                    'rooms/02.jpg',
                    'rooms/01.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Junior Suite',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->value('id'),
                'images' => json_encode([
                    'rooms/04.jpg',
                    'rooms/02.jpg',
                    'rooms/01.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Family Suite',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->value('id'),
                'images' => json_encode(['rooms/05.jpg']),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Relax Suite',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->inRandomOrder()->value('id'),
                'images' => json_encode([
                    'rooms/06.jpg',
                    'rooms/02.jpg',
                    'rooms/03.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/01.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'Luxury Suite',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->inRandomOrder()->value('id'),
                'images' => json_encode([
                    'rooms/01.jpg',
                    'rooms/02.jpg',
                    'rooms/03.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
            [
                'name' => 'President Room',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',
                'room_category_id' => RoomCategory::query()->inRandomOrder()->value('id'),
                'images' => json_encode([
                    'rooms/02.jpg',
                    'rooms/01.jpg',
                    'rooms/03.jpg',
                    'rooms/04.jpg',
                    'rooms/05.jpg',
                    'rooms/06.jpg',
                ]),
                'price' => rand(100, 200),
                'number_of_rooms' => rand(1, 10),
                'number_of_beds' => rand(1, 4),
                'max_adults' => rand(2, 6),
                'max_children' => rand(1, 3),
                'size' => rand(100, 200),
            ],
        ];

        Booking::query()->truncate();
        BookingAddress::query()->truncate();
        BookingRoom::query()->truncate();
        DB::table('ht_booking_services')->truncate();

        foreach ($rooms as $room) {
            $room['tax_id'] = 1;
            $room['is_featured'] = rand(0, 1);

            $room = Room::query()->create($room);

            $room->amenities()->sync([1, 2, 3, 4, 6, 7, 9, 11]);

            Slug::query()->create([
                'reference_type' => Room::class,
                'reference_id' => $room->id,
                'key' => Str::slug($room->name),
                'prefix' => SlugHelper::getPrefix(Room::class),
            ]);
        }
    }
}
