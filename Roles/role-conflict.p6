role Sleeping {
    method lie {
        say "Reclining horizontally...";
    }
}

role Lying {
    method lie {
        say "Telling an untruth...";
    }
}

class SleepingLiar does Sleeping does Lying {}    # CONFLICT!

# Method 'lie' must be resolved by class SleepingLiar because it exists in multiple roles (Lying, Sleeping)
