@extends(HotelHelper::viewPath('customers.master'))

@section('content')
    <div class="customer-welcome">
        <div>
            <span class="customer-eyebrow">{{ __('Welcome back') }}</span>
            <h1>{{ auth('customer')->user()->name }}</h1>
            <p>{{ __('Manage your stays, profile and preferences in one place.') }}</p>
        </div>
        <a class="customer-outline-button" href="{{ route('customer.bookings') }}">{{ __('View bookings') }}</a>
    </div>

    <div class="customer-feature-grid">
        <a class="customer-feature-card" href="{{ route('customer.bookings') }}">
            <span class="customer-feature-icon"><i class="fa fa-calendar"></i></span>
            <span><strong>{{ __('My Bookings') }}</strong><small>{{ __('View upcoming and past stays') }}</small></span>
            <i class="fa fa-arrow-right customer-feature-arrow"></i>
        </a>
        @foreach ([
            ['fa-bell', 'My Food'],
            ['fa-bed', 'My Housekeeping'],
            ['fa-bell', 'My Concierge'],
            ['fa-plane', 'My Airport Transfer'],
            ['fa-tag', 'My Offers'],
            ['fa-credit-card', 'My Wallet'],
            ['fa-life-ring', 'My Support Tickets'],
            ['fa-check', 'My Requests'],
        ] as [$icon, $label])
            <div class="customer-feature-card is-coming-soon" data-coming-soon tabindex="0" role="button" aria-expanded="false">
                <span class="customer-feature-icon"><i class="fa {{ $icon }}"></i></span>
                <span class="feature-copy"><small>{{ __('Coming soon') }}</small><strong>{{ __($label) }}</strong></span>
            </div>
        @endforeach
    </div>

    <script>
        document.querySelectorAll('[data-coming-soon]').forEach((feature) => {
            const toggleFeature = () => {
                const isSelected = feature.classList.toggle('is-selected')
                feature.setAttribute('aria-expanded', isSelected ? 'true' : 'false')

                if (isSelected) {
                    feature.scrollIntoView({ behavior: 'smooth', block: 'nearest' })
                }
            }

            feature.addEventListener('click', toggleFeature)
            feature.addEventListener('keydown', (event) => {
                if (event.key === 'Enter' || event.key === ' ') {
                    event.preventDefault()
                    toggleFeature()
                }
            })
        })
    </script>

    <div class="panel panel-default customer-info-panel">
        <div class="panel-heading">
            <h2>{{ __('Account information') }}</h2>
            <a href="{{ route('customer.edit-account') }}">{{ __('Edit profile') }} <i class="fa fa-arrow-right"></i></a>
        </div>

        <div class="customer-info-grid">
            <div class="row">
                <div class="col-md-6">
                    @if (auth('customer')->user()->name)
                        <p>
                            <strong>
                                {{ __('Name') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->name }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->email)
                        <p>
                            <strong>
                                {{ __('Email') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->email }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->country)
                        <p>
                            <strong>
                                {{ __('Country') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->country }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->city)
                        <p>
                            <strong>
                                {{ __('City') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->city }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->zip)
                        <p>
                            <strong>
                                {{ __('Postal / Zip code') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->zip }}</i>
                        </p>
                    @endif
                </div>
                <div class="col-md-6">
                    @if (auth('customer')->user()->dob)
                        <p>
                            <strong>
                                {{ __('Date of birth') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->dob }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->phone)
                        <p>
                            <strong>
                                {{ __('Phone') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->phone }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->state)
                        <p>
                            <strong>
                                {{ __('State / Province') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->state }}</i>
                        </p>
                    @endif

                    @if (auth('customer')->user()->address)
                        <p>
                            <strong>
                                {{ __('Address') }}
                            </strong>:
                            <i>{{ auth('customer')->user()->address }}</i>
                        </p>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
