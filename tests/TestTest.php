<?php

    declare(strict_types=1);

    use PHPUnit\Framework\TestCase;

    final class TestTest extends TestCase {
        public function testConnection(): void {
            $this->assertSame(1, 1);
        }
    }

?>