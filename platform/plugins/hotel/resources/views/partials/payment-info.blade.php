<div class="my-3">
    <x-core::datagrid>
        <x-core::datagrid.item :title="trans('plugins/payment::payment.payer_name')">
            {{ $booking->address->full_name }}
        </x-core::datagrid.item>
        <x-core::datagrid.item :title="trans('plugins/payment::payment.email')">
            {{ $booking->address->email }}
        </x-core::datagrid.item>
        <x-core::datagrid.item :title="trans('plugins/payment::payment.phone')">
            {{ $booking->address->phone }}
        </x-core::datagrid.item>
        @if ($booking->payment_receipt)
            <x-core::datagrid.item :title="__('Payment receipt')">
                <a href="{{ route('booking.payment-receipt', $booking->getKey()) }}">{{ __('Download receipt') }}</a>
            </x-core::datagrid.item>
        @endif
    </x-core::datagrid>
</div>
