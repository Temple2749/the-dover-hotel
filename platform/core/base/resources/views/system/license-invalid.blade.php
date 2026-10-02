@php
    $manageLicense = auth()
        ->user()
        ->hasPermission('core.manage.license');
@endphp

<x-core::alert
    type="warning"
    :important="true"
    @class(['alert-license alert-sticky small', 'vertical-wrapper' => AdminAppearance::isVerticalLayout()])
    icon=""
    @style(['display: none' => $hidden ?? true])
    data-bb-toggle="authorized-reminder"
>
    <div class="{{ AdminAppearance::getContainerWidth() }}">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                Welcome to Dover Hotel Admin. Your changes are being made with your staff ID and are being recorded.
            </div>

            <button
                type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="close"
            ></button>
        </div>
    </div>
</x-core::alert>

@if ($manageLicense)
    @include('core/base::system.partials.license-activation-modal')
@endif
