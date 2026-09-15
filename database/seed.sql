-- =====================================================================
-- CyberHunt seed data: generated from CYBER_HUNT_-_(3).docx
-- Populates: 1 event, 360 challenges, hints per challenge.
-- NOTE: flag_hash currently holds PLAINTEXT answers (or 'TBD' where the
--       source document did not give one - see REVIEW_NEEDED.md).
--       Hash these before the event goes live - see README.md.
-- Run after schema.sql:
--   psql -U postgres -d cyberhunt -f seed.sql
-- =====================================================================

INSERT INTO events (name, slug, description, start_time, end_time, status)
VALUES ('CyberHunt 2026', 'cyberhunt-2026', 'Flagship CyberHunt event covering Hidden Clue, Password Puzzles, OSINT, Encoding/Decoding, Web Vulnerabilities, and C Coding challenges.', NOW(), NOW() + INTERVAL '7 days', 'upcoming');

-- All challenges belong to the event created above.
-- (Adjust event dates/name above before running in production.)

-- [1/360] Hidden Clue / easy / Hidden Clue Riddle #1
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #1',
    'I have keys but open no locks. I have space but no room. You can enter, but you cannot walk inside me. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Keyboard',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You use me while typing', 1, 1),
  ('I have many keys', 2, 2),
  ('"Enter" is one of them', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [2/360] Hidden Clue / easy / Hidden Clue Riddle #2
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #2',
    'I speak without a mouth and hear without ears. I have no body, but I come alive when sound reaches me. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Echo',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You often hear me in mountains', 1, 1),
  ('I repeat what you say', 2, 2),
  ('Sound creates me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [3/360] Hidden Clue / easy / Hidden Clue Riddle #3
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #3',
    'The more you take from me, the bigger I become. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Hole',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Removing something creates me', 1, 1),
  ('Digging can make me larger', 2, 2),
  ('I am an empty space', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [4/360] Hidden Clue / easy / Hidden Clue Riddle #4
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #4',
    'I have a face and two hands, but no arms or legs. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Clock',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I measure time', 1, 1),
  ('My hands move', 2, 2),
  ('I may hang on a wall', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [5/360] Hidden Clue / easy / Hidden Clue Riddle #5
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #5',
    'I get wetter as I dry something else. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Towel',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You use me after a shower', 1, 1),
  ('I absorb water', 2, 2),
  ('Drying makes me wet', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [6/360] Hidden Clue / easy / Hidden Clue Riddle #6
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #6',
    'I have one eye but cannot see. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Needle',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I am used for sewing', 1, 1),
  ('Thread passes through my eye', 2, 2),
  ('I am thin and sharp', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [7/360] Hidden Clue / easy / Hidden Clue Riddle #7
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #7',
    'I become shorter every time I work, yet I help you see. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Candle',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I contain a wick', 1, 1),
  ('Fire consumes me', 2, 2),
  ('I produce light', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [8/360] Hidden Clue / easy / Hidden Clue Riddle #8
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #8',
    'I have teeth but cannot bite. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Comb',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I am used with hair', 1, 1),
  ('My teeth are arranged in rows', 2, 2),
  ('I help remove tangles', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [9/360] Hidden Clue / easy / Hidden Clue Riddle #9
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #9',
    'I fly without wings and cry without eyes. Wherever I go, darkness follows me. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Cloud',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I float in the sky', 1, 1),
  ('I can produce rain', 2, 2),
  ('I can block sunlight', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [10/360] Hidden Clue / easy / Hidden Clue Riddle #10
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #10',
    'I have a neck but no head, and I can hold something inside me. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Bottle',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I can contain water', 1, 1),
  ('My top is called a neck', 2, 2),
  ('You can put a cap on me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [11/360] Hidden Clue / easy / Hidden Clue Riddle #11
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #11',
    'I am full of holes, but I can still hold water. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Sponge',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I absorb liquids', 1, 1),
  ('I am soft', 2, 2),
  ('You may find me in a kitchen', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [12/360] Hidden Clue / easy / Hidden Clue Riddle #12
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #12',
    'I have pages but I am not a tree. I contain stories but cannot speak. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Book',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You read me', 1, 1),
  ('I contain pages', 2, 2),
  ('Libraries contain many of me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [13/360] Hidden Clue / easy / Hidden Clue Riddle #13
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #13',
    'I follow you everywhere during the day but disappear when the light is gone. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Shadow',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Light creates me', 1, 1),
  ('I copy your shape', 2, 2),
  ('Darkness can make me disappear', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [14/360] Hidden Clue / easy / Hidden Clue Riddle #14
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #14',
    'I have numbers and hands but cannot clap. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Clock',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I tell time', 1, 1),
  ('My hands move', 2, 2),
  ('I have numbers around my face', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [15/360] Hidden Clue / easy / Hidden Clue Riddle #15
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #15',
    'I can be cracked, made, told, and played. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Joke',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('People laugh at me', 1, 1),
  ('You can "tell" me', 2, 2),
  ('You can "play" me on someone', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [16/360] Hidden Clue / easy / Hidden Clue Riddle #16
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #16',
    'I disappear as soon as you say my name. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Silence',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I involve the absence of sound', 1, 1),
  ('Speaking destroys me', 2, 2),
  ('Libraries often ask for me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [17/360] Hidden Clue / easy / Hidden Clue Riddle #17
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #17',
    'I am always coming but never arrive. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Tomorrow',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I refer to the future', 1, 1),
  ('When I arrive, I become today', 2, 2),
  ('Calendars help you find me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [18/360] Hidden Clue / easy / Hidden Clue Riddle #18
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #18',
    'I have a thumb and four fingers, but I am not alive. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Glove',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You wear me', 1, 1),
  ('I cover your hand', 2, 2),
  ('I have separate finger spaces', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [19/360] Hidden Clue / easy / Hidden Clue Riddle #19
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #19',
    'I can travel around the world while staying in one corner. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Stamp',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I belong on mail', 1, 1),
  ('I help letters travel', 2, 2),
  ('I am usually stuck to an envelope', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [20/360] Hidden Clue / easy / Hidden Clue Riddle #20
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #20',
    'I am black when clean and white when dirty. What am I?',
    'Hidden Clue',
    'easy'::difficulty_level,
    5,
    'Blackboard',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Teachers use me', 1, 1),
  ('Chalk makes me white', 2, 2),
  ('My normal surface is dark. #', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [21/360] Hidden Clue / medium / Hidden Clue Riddle #21
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #21',
    'I can be written, broken, kept, and given. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Promise',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You can make me to someone', 1, 1),
  ('Breaking me means not keeping your word', 2, 2),
  ('Keeping me means honoring your word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [22/360] Hidden Clue / medium / Hidden Clue Riddle #22
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #22',
    'I have cities but no houses, forests but no trees, and water but no fish. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Map',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I represent locations', 1, 1),
  ('You can use me for navigation', 2, 2),
  ('I can show cities and rivers', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [23/360] Hidden Clue / medium / Hidden Clue Riddle #23
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #23',
    'I have an eye, but I cannot see. I can be used to measure distance. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Telescope',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I help you see distant objects', 1, 1),
  ('Astronomers use me', 2, 2),
  ('My lenses point toward the sky', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [24/360] Hidden Clue / medium / Hidden Clue Riddle #24
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #24',
    'I am taken before you get me, and I can be good or bad. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Decision',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You make me', 1, 1),
  ('Choices lead to me', 2, 2),
  ('I can have consequences', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [25/360] Hidden Clue / medium / Hidden Clue Riddle #25
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #25',
    'I can run but never walk. I have a bed but never sleep. I have a mouth but never eat. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'River',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I contain flowing water', 1, 1),
  ('I have a riverbed', 2, 2),
  ('I can have a mouth', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [26/360] Hidden Clue / medium / Hidden Clue Riddle #26
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #26',
    'I have branches, but no leaves, trunk, or fruit. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Bank',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I handle money', 1, 1),
  ('Large organizations have many locations', 2, 2),
  ('Those locations are called branches', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [27/360] Hidden Clue / medium / Hidden Clue Riddle #27
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #27',
    'I am invisible, but I can fill a room. I can be felt but not held. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Air',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You breathe me', 1, 1),
  ('Wind is moving me', 2, 2),
  ('You cannot normally see me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [28/360] Hidden Clue / medium / Hidden Clue Riddle #28
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #28',
    'I can be opened but never closed, and I can contain knowledge without speaking. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Book',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You turn my pages', 1, 1),
  ('I can contain knowledge', 2, 2),
  ('Reading me gives information', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [29/360] Hidden Clue / medium / Hidden Clue Riddle #29
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #29',
    'I have a head and a tail but no body. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Coin',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I am used as money', 1, 1),
  ('One side is called heads', 2, 2),
  ('The other side is called tails', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [30/360] Hidden Clue / medium / Hidden Clue Riddle #30
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #30',
    'The more there is of me, the less you see. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Darkness',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I am the opposite of light', 1, 1),
  ('Night can bring me', 2, 2),
  ('More of me means less visibility', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [31/360] Hidden Clue / medium / Hidden Clue Riddle #31
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #31',
    'I am lighter than a feather, but nobody can hold me for long. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Breath',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You do this constantly', 1, 1),
  ('You can hold me temporarily', 2, 2),
  ('Eventually you must release me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [32/360] Hidden Clue / medium / Hidden Clue Riddle #32
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #32',
    'I am a word of six letters. Remove one letter and twelve remain. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Dozens',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about the number twelve', 1, 1),
  ('The answer relates directly to twelve', 2, 2),
  ('Removing one character creates a related word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [33/360] Hidden Clue / medium / Hidden Clue Riddle #33
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #33',
    'I have many rings but no fingers. I can tell you how old something is. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Tree',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at my trunk', 1, 1),
  ('My rings form over time', 2, 2),
  ('Counting them can estimate age', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [34/360] Hidden Clue / medium / Hidden Clue Riddle #34
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #34',
    'I am not alive, but I grow. I have no lungs, but I need air. I have no mouth, but water kills me. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Fire',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I produce heat', 1, 1),
  ('Air helps me burn', 2, 2),
  ('Water can extinguish me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [35/360] Hidden Clue / medium / Hidden Clue Riddle #35
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #35',
    'I have a screen but I am not a television. I have windows but no walls. I can open files but have no hands. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Computer',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You interact with me digitally', 1, 1),
  ('I have software windows', 2, 2),
  ('I can open files', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [36/360] Hidden Clue / medium / Hidden Clue Riddle #36
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #36',
    'I can be long or short, grown or cut, painted or natural. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Nail',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You have several of me', 1, 1),
  ('I can be trimmed', 2, 2),
  ('People sometimes paint me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [37/360] Hidden Clue / medium / Hidden Clue Riddle #37
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #37',
    'I have a root but I am not a plant. I have branches but I am not a tree. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Network',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about computers', 1, 1),
  ('Devices can connect through me', 2, 2),
  ('Networks can have hierarchical structures', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [38/360] Hidden Clue / medium / Hidden Clue Riddle #38
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #38',
    'I can be copied but never truly duplicated. I can be digital, physical, or genetic. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Information',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Files contain me', 1, 1),
  ('DNA carries me', 2, 2),
  ('Copies can preserve me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [39/360] Hidden Clue / medium / Hidden Clue Riddle #39
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #39',
    'I have no voice, but I can answer your questions. I have no brain, but I can contain millions of facts. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Database',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('I store structured information', 1, 1),
  ('Queries can retrieve information from me', 2, 2),
  ('Computers commonly use me', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [40/360] Hidden Clue / medium / Hidden Clue Riddle #40
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #40',
    'I can unlock something without being a key. I can be secret but also shared. What am I?',
    'Hidden Clue',
    'medium'::difficulty_level,
    10,
    'Password',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Websites may ask for me', 1, 1),
  ('Keep me secret', 2, 2),
  ('I can grant access. #', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [41/360] Hidden Clue / hard / Hidden Clue Riddle #41
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #41',
    'I hide in plain sight. Read my beginnings, not my words. "Silent Owls Hide Every Night." What secret word appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'SOHEN',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Ignore the meanings', 1, 1),
  ('Look at the first letters', 2, 2),
  ('Read them in order', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [42/360] Hidden Clue / hard / Hidden Clue Riddle #42
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #42',
    '"Brave Eagles Attack Daily." Take what comes first from every word. What do you obtain?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'BEAD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Examine the beginning of each word', 1, 1),
  ('Take one letter from each', 2, 2),
  ('The result is a four-letter word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [43/360] Hidden Clue / hard / Hidden Clue Riddle #43
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #43',
    '"Hidden clues are often buried between ordinary words." Take the first letter of each word. What pattern appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'HCAOBOW',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Do not read normally', 1, 1),
  ('Focus on word beginnings', 2, 2),
  ('Take one letter per word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [44/360] Hidden Clue / hard / Hidden Clue Riddle #44
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #44',
    'I am found once in "minute," twice in "moment," but never in "hour." What am I?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'M',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the spelling', 1, 1),
  ('Count letters', 2, 2),
  ('Compare the three words', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [45/360] Hidden Clue / hard / Hidden Clue Riddle #45
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #45',
    'I appear once in "year," twice in "week," but never in "day." What am I?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'E',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Examine the letters', 1, 1),
  ('Count occurrences', 2, 2),
  ('Ignore the actual lengths of time', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [46/360] Hidden Clue / hard / Hidden Clue Riddle #46
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #46',
    'I am hidden in "cYBER Hunt." Find the unusual capital letters and read them',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'YH',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Capitals matter', 1, 1),
  ('Ignore lowercase letters', 2, 2),
  ('Read only the capitals', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [47/360] Hidden Clue / hard / Hidden Clue Riddle #47
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #47',
    '"sEcUrE PaSsWoRd" contains a hidden message through alternating capitals. What is it?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'EUPSWRD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Capitalization is intentional', 1, 1),
  ('Ignore lowercase letters', 2, 2),
  ('Read capitals left to right', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [48/360] Hidden Clue / hard / Hidden Clue Riddle #48
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #48',
    'I am hidden in this sequence: 3-1-20. Convert the numbers using A=1, B=2, C=3. What word appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'CAT',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A equals 1', 1, 1),
  ('Convert each number to a letter', 2, 2),
  ('Read the letters together', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [49/360] Hidden Clue / hard / Hidden Clue Riddle #49
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #49',
    '19-5-3-18-5-20 uses A=1. What hidden word appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'SECRET',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Use A=1', 1, 1),
  ('Convert each number', 2, 2),
  ('Read from left to right', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [50/360] Hidden Clue / hard / Hidden Clue Riddle #50
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #50',
    'A message says: "The treasure is under the old tree." But every third word is the real clue. Which hidden word is obtained from "The treasure is under the old tree"?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'Is',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Number the words', 1, 1),
  ('Select positions 3 and 6', 2, 2),
  ('Focus on the extracted words', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [51/360] Hidden Clue / hard / Hidden Clue Riddle #51
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #51',
    'Read the last letters of: "cyber hunt code". What hidden sequence appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'RTE',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Do not use the first letters', 1, 1),
  ('Look at the ends', 2, 2),
  ('Take one letter from each word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [52/360] Hidden Clue / hard / Hidden Clue Riddle #52
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #52',
    'Read the first and last letters of "Cipher". What two-letter clue appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'CR',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at both ends', 1, 1),
  ('Ignore the middle letters', 2, 2),
  ('Combine the two letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [53/360] Hidden Clue / hard / Hidden Clue Riddle #53
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #53',
    '"C0D3" replaces letters with visually similar numbers. What word is being represented?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'CODE',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('0 can replace O', 1, 1),
  ('3 can replace E', 2, 2),
  ('Read the result normally', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [54/360] Hidden Clue / hard / Hidden Clue Riddle #54
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #54',
    '"53 45 43 52 45 54" is written in hexadecimal ASCII. What hidden word does it reveal?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'SECRET',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The values represent characters', 1, 1),
  ('Think ASCII', 2, 2),
  ('Convert each hexadecimal pair', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [55/360] Hidden Clue / hard / Hidden Clue Riddle #55
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #55',
    '"01000011 01001111 01000100 01000101" hides a word in binary ASCII. What is it?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'CODE',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Each group contains eight bits', 1, 1),
  ('They represent ASCII characters', 2, 2),
  ('Convert each group separately', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [56/360] Hidden Clue / hard / Hidden Clue Riddle #56
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #56',
    'A note contains the words "Red Orange Yellow Green Blue." Take their first letters. What hidden word appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'ROYGB',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look only at the beginnings', 1, 1),
  ('Each color contributes one letter', 2, 2),
  ('Preserve the original order', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [57/360] Hidden Clue / hard / Hidden Clue Riddle #57
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #57',
    '"SILENT" is written backward. What hidden word appears when you reverse it?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'TNELIS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Start at the right', 1, 1),
  ('Read toward the left', 2, 2),
  ('Reverse every character', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [58/360] Hidden Clue / hard / Hidden Clue Riddle #58
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #58',
    'The clue is "LFMMP." Every letter is one position after the intended letter in the alphabet. What word is hidden?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'KELLO',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('L becomes K', 1, 1),
  ('F becomes E', 2, 2),
  ('Move every letter backward once', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [59/360] Hidden Clue / hard / Hidden Clue Riddle #59
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #59',
    '"Uifsf" was created by shifting every alphabet letter forward by one. What was the original word?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'There',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Move each letter backward', 1, 1),
  ('U becomes T', 2, 2),
  ('Read the resulting word normally', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [60/360] Hidden Clue / hard / Hidden Clue Riddle #60
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hidden Clue Riddle #60',
    'A paper says: "Look between the lines." The visible lines are: C A T X Y Z Read only the letters that appear between the first and last letters of each line. What hidden sequence appears?',
    'Hidden Clue',
    'hard'::difficulty_level,
    15,
    'AYT',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Focus on the middle positions', 1, 1),
  ('Ignore the first and last characters', 2, 2),
  ('Read the middle letters from top to bottom', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [61/360] Password Puzzles / easy / A1Z26 Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'A1Z26 Password',
    'Convert 3-25-2-5-18 to letters',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A=1', 1, 1),
  ('map numbers', 2, 2),
  ('read sequentially', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [62/360] Password Puzzles / easy / Reverse Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse Password',
    'TERCES is given',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Read backward', 1, 1),
  ('reverse string', 2, 2),
  ('obtain password', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [63/360] Password Puzzles / easy / Missing Vowel
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Missing Vowel',
    'CYB_R',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Cyber-related word', 1, 1),
  ('missing vowel', 2, 2),
  ('complete it', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [64/360] Password Puzzles / easy / Keyboard Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Keyboard Shift',
    'SFT requires keys immediately to the right',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think QWERTY', 1, 1),
  ('move one key', 2, 2),
  ('read result', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [65/360] Password Puzzles / easy / Number-to-Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Number-to-Letter',
    '20 5 19 20',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A1Z26', 1, 1),
  ('map each number', 2, 2),
  ('form word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [66/360] Password Puzzles / easy / Odd Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Odd Letters',
    'Extract characters in odd positions',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Ignore even positions', 1, 1),
  ('start at 1', 2, 2),
  ('combine', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [67/360] Password Puzzles / easy / Even Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Even Letters',
    'Extract even-position characters',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Count positions', 1, 1),
  ('take 2,4,6', 2, 2),
  ('combine', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [68/360] Password Puzzles / easy / Anagram
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Anagram',
    'RTAEHC',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Rearrange', 1, 1),
  ('cybersecurity term', 2, 2),
  ('"TH..."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [69/360] Password Puzzles / easy / Simple Caesar
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Simple Caesar',
    'Shift every letter by 1',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Caesar cipher', 1, 1),
  ('shift backward', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [70/360] Password Puzzles / easy / First Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'First Letters',
    'Cyber Hunters Need Trust',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Take initials', 1, 1),
  ('CHNT', 2, 2),
  ('use clue context', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [71/360] Password Puzzles / easy / Last Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Last Letters',
    'Four words hide their final characters',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Ignore beginnings', 1, 1),
  ('take endings', 2, 2),
  ('combine', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [72/360] Password Puzzles / easy / Binary Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Binary Password',
    '01000011 01011000',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('8-bit', 1, 1),
  ('ASCII', 2, 2),
  ('convert', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [73/360] Password Puzzles / easy / Morse Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Morse Password',
    '-.-. --- -',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Dashes/dots', 1, 1),
  ('Morse', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [74/360] Password Puzzles / easy / Hex Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hex Password',
    '43 54 46',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Hexadecimal', 1, 1),
  ('ASCII', 2, 2),
  ('read', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [75/360] Password Puzzles / easy / ROT13
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'ROT13',
    'PLFURE',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('ROT13', 1, 1),
  ('shift 13', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [76/360] Password Puzzles / easy / Alphabet Position
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabet Position',
    'Find positions of C-Y-B-E-R',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A=1', 1, 1),
  ('calculate', 2, 2),
  ('concatenate', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [77/360] Password Puzzles / easy / Word Length Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Word Length Password',
    'Five clue words have lengths 4-3-5-2',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Count characters', 1, 1),
  ('use numbers', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [78/360] Password Puzzles / easy / Symbol Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Symbol Password',
    'Symbols correspond to keyboard numbers',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at keyboard', 1, 1),
  ('symbols above numbers', 2, 2),
  ('map them', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [79/360] Password Puzzles / easy / Mirror Text
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Mirror Text',
    'A word appears reflected',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reverse', 1, 1),
  ('read normally', 2, 2),
  ('identify word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [80/360] Password Puzzles / easy / Simple Riddle Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Simple Riddle Password',
    '"I protect accounts but am not a lock."',
    'Password Puzzles',
    'easy'::difficulty_level,
    5,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Used during login', 1, 1),
  ('secret', 2, 2),
  ('password', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [81/360] Password Puzzles / medium / Double Caesar
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Double Caesar',
    'Two Caesar shifts are applied',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Decode one layer', 1, 1),
  ('test result', 2, 2),
  ('repeat', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [82/360] Password Puzzles / medium / Base64 Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Base64 Password',
    'Encoded password supplied',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Recognize Base64', 1, 1),
  ('decode', 2, 2),
  ('inspect result', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [83/360] Password Puzzles / medium / Vigenère Intro
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Vigenère Intro',
    'Ciphertext + key provided',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Key is important', 1, 1),
  ('Vigenère', 2, 2),
  ('apply key repeatedly', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [84/360] Password Puzzles / medium / Keyboard Diagonal
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Keyboard Diagonal',
    'Letters are one key diagonally displaced',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('QWERTY', 1, 1),
  ('inspect neighboring keys', 2, 2),
  ('reverse displacement', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [85/360] Password Puzzles / medium / Mixed Case
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Mixed Case',
    'Uppercase letters contain one password',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Ignore lowercase', 1, 1),
  ('extract capitals', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [86/360] Password Puzzles / medium / Word-to-Number
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Word-to-Number',
    'ONE, THREE, FIVE, etc',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Convert words', 1, 1),
  ('numbers', 2, 2),
  ('use A1Z26', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [87/360] Password Puzzles / medium / Prime Positions
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Prime Positions',
    'Extract letters at prime-numbered positions',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Prime numbers', 1, 1),
  ('2,3,5,7', 2, 2),
  ('extract', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [88/360] Password Puzzles / medium / Fibonacci Positions
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fibonacci Positions',
    'Extract letters at Fibonacci positions',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('1,1,2,3,5', 1, 1),
  ('avoid duplicates', 2, 2),
  ('extract', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [89/360] Password Puzzles / medium / Rail Fence
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Rail Fence',
    'Ciphertext created using 3 rails',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Rail Fence cipher', 1, 1),
  ('determine rails', 2, 2),
  ('reconstruct', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [90/360] Password Puzzles / medium / Column Transposition
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Column Transposition',
    'Key determines column order',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Key is supplied', 1, 1),
  ('reorder columns', 2, 2),
  ('read rows', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [91/360] Password Puzzles / medium / Hex → Base64
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hex → Base64',
    'Two encoding layers',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Decode hex first', 1, 1),
  ('output resembles Base64', 2, 2),
  ('decode again', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [92/360] Password Puzzles / medium / ROT + Reverse
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'ROT + Reverse',
    'Cipher requires both transformations',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Try ROT13', 1, 1),
  ('reverse', 2, 2),
  ('check readability', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [93/360] Password Puzzles / medium / ASCII Decimal
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'ASCII Decimal',
    '67 84 70',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('ASCII decimal', 1, 1),
  ('convert values', 2, 2),
  ('read text', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [94/360] Password Puzzles / medium / XOR Puzzle
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'XOR Puzzle',
    'Text encrypted with a one-byte key',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('XOR is reversible', 1, 1),
  ('key supplied indirectly', 2, 2),
  ('apply XOR', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [95/360] Password Puzzles / medium / Password Riddle Chain
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Password Riddle Chain',
    'Three riddles each provide one word',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Solve separately', 1, 1),
  ('order matters', 2, 2),
  ('concatenate', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [96/360] Password Puzzles / medium / Date Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Date Password',
    'Historical clue gives a date',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Identify event', 1, 1),
  ('determine date', 2, 2),
  ('format as instructed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [97/360] Password Puzzles / medium / Periodic Table Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Periodic Table Password',
    'Atomic numbers represent letters',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Identify elements', 1, 1),
  ('use atomic numbers', 2, 2),
  ('map to letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [98/360] Password Puzzles / medium / Phone Keypad
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Phone Keypad',
    'Numbers correspond to letters',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think old mobile keypad', 1, 1),
  ('map numbers', 2, 2),
  ('form word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [99/360] Password Puzzles / medium / Braille Pattern
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Braille Pattern',
    'Six-dot patterns provided',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Braille alphabet', 1, 1),
  ('map cells', 2, 2),
  ('combine letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [100/360] Password Puzzles / medium / Multi-Step Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Multi-Step Password',
    'Anagram → Caesar → Base64',
    'Password Puzzles',
    'medium'::difficulty_level,
    10,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Solve obvious transformation', 1, 1),
  ('decode next layer', 2, 2),
  ('repeat', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [101/360] Password Puzzles / hard / Vigenère with Hidden Key
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Vigenère with Hidden Key',
    'Vigenère with Hidden Key',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Find key first', 1, 1),
  ('identify Vigenère', 2, 2),
  ('decrypt', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [102/360] Password Puzzles / hard / Encrypted Archive Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Encrypted Archive Password',
    'Encrypted Archive Password',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Inspect archive metadata', 1, 1),
  ('find clue file', 2, 2),
  ('derive password', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [103/360] Password Puzzles / hard / Known-Plaintext XOR
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Known-Plaintext XOR',
    'Known-Plaintext XOR',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare known text', 1, 1),
  ('XOR corresponding bytes', 2, 2),
  ('derive key', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [104/360] Password Puzzles / hard / Multi-Key Cipher
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Multi-Key Cipher',
    'Multi-Key Cipher',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('There are two keys', 1, 1),
  ('identify which applies first', 2, 2),
  ('decrypt sequentially', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [105/360] Password Puzzles / hard / Transposition + Substitution
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Transposition + Substitution',
    'Transposition + Substitution',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look for scrambled positions', 1, 1),
  ('reconstruct', 2, 2),
  ('apply substitution', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [106/360] Password Puzzles / hard / Password from Metadata
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Password from Metadata',
    'Password from Metadata',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Inspect document metadata', 1, 1),
  ('author/title/date', 2, 2),
  ('combine as instructed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [107/360] Password Puzzles / hard / Hash Puzzle
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Hash Puzzle',
    'Hash Puzzle',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Identify hash type', 1, 1),
  ('use provided candidate list', 2, 2),
  ('compare hashes', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [108/360] Password Puzzles / hard / Dictionary Pattern
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Dictionary Pattern',
    'Dictionary Pattern',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Password consists of clue-derived words', 1, 1),
  ('identify theme', 2, 2),
  ('order words', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [109/360] Password Puzzles / hard / Prime + Caesar
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Prime + Caesar',
    'Prime + Caesar',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Extract prime positions', 1, 1),
  ('then Caesar decode', 2, 2),
  ('determine shift from clue', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [110/360] Password Puzzles / hard / Recursive Encoding
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Recursive Encoding',
    'Recursive Encoding',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Decode output', 1, 1),
  ('if encoded again, repeat', 2, 2),
  ('stop at plaintext', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [111/360] Password Puzzles / hard / QR + Cipher
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'QR + Cipher',
    'QR + Cipher',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Scan QR', 1, 1),
  ('extracted text isn''t final', 2, 2),
  ('identify cipher', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [112/360] Password Puzzles / hard / Audio Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Audio Password',
    'Audio Password',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Listen carefully', 1, 1),
  ('inspect waveform/spectrogram', 2, 2),
  ('find hidden signal', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [113/360] Password Puzzles / hard / Image Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Image Password',
    'Image Password',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Inspect metadata', 1, 1),
  ('inspect visual anomalies', 2, 2),
  ('decode hidden text', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [114/360] Password Puzzles / hard / Puzzle Box
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Puzzle Box',
    'Puzzle Box',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Several clues point to one key', 1, 1),
  ('solve dependencies', 2, 2),
  ('construct password', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [115/360] Password Puzzles / hard / Dictionary Attack Simulation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Dictionary Attack Simulation',
    'Dictionary Attack Simulation',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Candidate list provided', 1, 1),
  ('identify pattern', 2, 2),
  ('find matching hash', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [116/360] Password Puzzles / hard / Time-Based Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Time-Based Password',
    'Time-Based Password',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Timestamp is important', 1, 1),
  ('determine format', 2, 2),
  ('calculate required value', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [117/360] Password Puzzles / hard / Layered Number Cipher
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Layered Number Cipher',
    'Layered Number Cipher',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Numbers are not directly letters', 1, 1),
  ('identify first transformation', 2, 2),
  ('repeat', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [118/360] Password Puzzles / hard / Polybius Square
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Polybius Square',
    'Polybius Square',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Numbers are pairs', 1, 1),
  ('use 5×5 grid', 2, 2),
  ('decode', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [119/360] Password Puzzles / hard / Bacon Cipher
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Bacon Cipher',
    'Bacon Cipher',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Two types of characters are present', 1, 1),
  ('classify them', 2, 2),
  ('decode groups of five', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [120/360] Password Puzzles / hard / Final Password Meta
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Final Password Meta',
    'Final Password Meta',
    'Password Puzzles',
    'hard'::difficulty_level,
    15,
    'TBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Previous solved passwords matter', 1, 1),
  ('identify common relationship', 2, 2),
  ('construct final password', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [121/360] OSINT / easy / Q1. The First Search
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q1. The First Search',
    'You are given the name of a public organization and asked to find its official website. What should you search for first?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Name',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Start with the organization''s exact name', 1, 1),
  ('Avoid adding random words', 2, 2),
  ('Look for an official domain', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [122/360] OSINT / easy / Q2. Username Hunt
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q2. Username Hunt',
    'A person uses the username tech_raj on one public platform. What can you try searching to find whether the same username exists elsewhere?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Username',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search the username exactly', 1, 1),
  ('Try different platforms', 2, 2),
  ('Don''t change the spelling', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [123/360] OSINT / easy / Q3. Image Search
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q3. Image Search',
    'You receive an image and want to know where it appeared online before. Which type of search is most useful?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Reverse',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You don''t need to describe the image', 1, 1),
  ('Use the image itself', 2, 2),
  ('Search engines support this', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [124/360] OSINT / easy / Q4. Public Information
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q4. Public Information',
    'Information that anyone can legally access on the internet is generally called what?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Open-source',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is not private information', 1, 1),
  ('It can come from websites, news, maps, etc', 2, 2),
  ('The first word is "Open."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [125/360] OSINT / easy / Q5. Website Date
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q5. Website Date',
    'You find two articles about the same event. One was published in 2020 and another in 2024. Which one is generally more recent?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    '2024',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare the years', 1, 1),
  ('Bigger year = later date', 2, 2),
  ('Don''t judge by article position', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [126/360] OSINT / easy / Q6. Fake Account Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q6. Fake Account Clue',
    'An account has thousands of followers but was created yesterday. What should this make you do?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Verify',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Check the account history', 1, 1),
  ('Look for other evidence', 2, 2),
  ('Don''t immediately trust the account', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [127/360] OSINT / easy / Q7. Location Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q7. Location Clue',
    'A photograph shows a famous tower. You recognize the tower. What can this information help you determine?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Location',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think geography', 1, 1),
  ('Famous landmarks are useful clues', 2, 2),
  ('What place contains the tower?', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [128/360] OSINT / easy / Q8. Map Investigation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q8. Map Investigation',
    'You know the name of a restaurant but not where it is. Which online tool would be useful for locating it?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Maps',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think maps', 1, 1),
  ('Search by name', 2, 2),
  ('It can show directions too', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [129/360] OSINT / easy / Q9. Username Consistency
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q9. Username Consistency',
    'You find the same unique username on three public websites. What might this suggest?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Connection',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare the names', 1, 1),
  ('Unique names are more useful', 2, 2),
  ('It is a clue, not absolute proof', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [130/360] OSINT / easy / Q10. Source Check
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q10. Source Check',
    'Before believing an online claim, what should you check first?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Source',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Ask who published it', 1, 1),
  ('Check credibility', 2, 2),
  ('Don''t rely only on the headline', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [131/360] OSINT / easy / Q11. Search Quotes
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q11. Search Quotes',
    'You want Google to search for an exact phrase such as Cyber Hunt 2026. What can you put around the phrase?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Quotes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('They are two identical symbols', 1, 1),
  ('They are commonly used for exact searches', 2, 2),
  ('Example: "Cyber Hunt 2026"', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [132/360] OSINT / easy / Q12. Social Media Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q12. Social Media Clue',
    'A public social-media post says someone attended an event on 15 August. What information does this provide?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Date',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about when something happened', 1, 1),
  ('It gives a point in time', 2, 2),
  ('It can help build a timeline', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [133/360] OSINT / easy / Q13. News Verification
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q13. News Verification',
    'Two websites report different information about the same event. What should you do?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Cross-check',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Don''t choose randomly', 1, 1),
  ('Find another reliable source', 2, 2),
  ('Compare the evidence', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [134/360] OSINT / easy / Q14. Domain Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q14. Domain Clue',
    'A website ends with .edu. What type of organization is it commonly associated with?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Education',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think education', 1, 1),
  ('Colleges often use it', 2, 2),
  ('It is different from .com', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [135/360] OSINT / easy / Q15. Photo Detail
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q15. Photo Detail',
    'You are given a street photograph. Which visible clue could help identify the country?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Sign',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at vehicles', 1, 1),
  ('Look at signs', 2, 2),
  ('Look at road markings', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [136/360] OSINT / easy / Q16. Metadata
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q16. Metadata',
    'Information stored inside a digital file, such as creation date or camera model, is called what?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Metadata',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is information about the file', 1, 1),
  ('It is not necessarily visible in the picture', 2, 2),
  ('It starts with "meta."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [137/360] OSINT / easy / Q17. Public Records
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q17. Public Records',
    'Government websites sometimes publish information that anyone can access. What type of information is this from an OSINT perspective?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Public',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is publicly available', 1, 1),
  ('It comes from an official source', 2, 2),
  ('No hacking is required', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [138/360] OSINT / easy / Q18. Screenshot Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q18. Screenshot Clue',
    'A screenshot contains a visible browser address bar. Why can this be useful?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'URL',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the top of the browser', 1, 1),
  ('It may contain a website address', 2, 2),
  ('The address can be searched', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [139/360] OSINT / easy / Q19. Search Engine
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q19. Search Engine',
    'Which tool is commonly used to discover publicly available webpages?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'Search',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Google is an example', 1, 1),
  ('Bing is another', 2, 2),
  ('It helps find information', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [140/360] OSINT / easy / Q20. Evidence
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q20. Evidence',
    'An investigator finds a claim on social media. Should the claim itself be considered proof?',
    'OSINT',
    'easy'::difficulty_level,
    5,
    'No # 🟡',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Anyone can post online', 1, 1),
  ('Look for supporting sources', 2, 2),
  ('Claims need verification', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [141/360] OSINT / medium / Q21. Exact Username
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q21. Exact Username',
    'You are investigating the username bluefox27. Searching "bluefox27" gives results on several websites. What is the next logical step?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Compare',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare profile information', 1, 1),
  ('Look for matching clues', 2, 2),
  ('Don''t assume all accounts belong to one person', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [142/360] OSINT / medium / Q22. Profile Picture
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q22. Profile Picture',
    'A public account uses a distinctive profile picture. What technique can help determine whether the picture appears elsewhere?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Reverse-search',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Use the image', 1, 1),
  ('Search visually', 2, 2),
  ('Look for matching results', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [143/360] OSINT / medium / Q23. Timeline
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q23. Timeline',
    'You find these public posts: - January --- Started college - March --- Joined a club - July --- Attended a competition What are you building by arranging these events chronologically?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Timeline',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Events are arranged by date', 1, 1),
  ('It shows sequence', 2, 2),
  ('It helps understand activity', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [144/360] OSINT / medium / Q24. Conflicting Dates
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q24. Conflicting Dates',
    'A website says an event happened on Monday, but the published date was Tuesday. What should you do?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Verify',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Check another source', 1, 1),
  ('Verify the actual event date', 2, 2),
  ('Don''t immediately assume either source is correct', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [145/360] OSINT / medium / Q25. Same Photo
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q25. Same Photo',
    'You find the same photograph on two websites, but one website claims it was taken in India and the other claims it was taken in France. What should you check?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Source',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search the original image', 1, 1),
  ('Check older versions', 2, 2),
  ('Look for location clues', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [146/360] OSINT / medium / Q26. Map Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q26. Map Clue',
    'A photo shows a road sign saying NH 44. Which type of information can this clue provide?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Location',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is related to roads', 1, 1),
  ('Search the road number', 2, 2),
  ('Think geography', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [147/360] OSINT / medium / Q27. Domain Investigation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q27. Domain Investigation',
    'You find a suspicious website claiming to belong to a company. The company''s official website uses a different domain. What should you compare?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Domain',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare spelling', 1, 1),
  ('Check the official website', 2, 2),
  ('Look for extra words or characters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [148/360] OSINT / medium / Q28. Archived Page
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q28. Archived Page',
    'A webpage has disappeared, but you want to see an older version. What type of service can help?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Archive',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think "history of the web."', 1, 1),
  ('Archived pages preserve older versions', 2, 2),
  ('One famous service is the Wayback Machine', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [149/360] OSINT / medium / Q29. Image Timestamp
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q29. Image Timestamp',
    'A photo''s metadata says it was created in 2022, but someone claims it was taken in 2025. What should you do?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Verify',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Metadata can sometimes be changed', 1, 1),
  ('Search for additional evidence', 2, 2),
  ('Compare dates', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [150/360] OSINT / medium / Q30. Multiple Sources
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q30. Multiple Sources',
    'One unknown blog makes a claim. Five independent reputable news organizations report the same event. Which has stronger support?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Multiple',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Consider source reliability', 1, 1),
  ('Consider independence', 2, 2),
  ('One source vs several', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [151/360] OSINT / medium / Q31. Search Operator
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q31. Search Operator',
    'You want search results only from example.com. Which search technique is useful?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'site:',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think site:', 1, 1),
  ('Put the domain after it', 2, 2),
  ('Example: site:example.com', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [152/360] OSINT / medium / Q32. Public Username + Bio
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q32. Public Username + Bio',
    'A username is found on two platforms. One profile contains the same public website link as the other. Does this provide stronger evidence of a connection?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Yes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare more than the username', 1, 1),
  ('Look for independent matching details', 2, 2),
  ('Think confidence', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [153/360] OSINT / medium / Q33. Location from Background
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q33. Location from Background',
    'A photograph has no location tag, but a shop sign in the background contains a city name. Can the sign help identify the location?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Yes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Read the sign', 1, 1),
  ('Search the name', 2, 2),
  ('Compare map results', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [154/360] OSINT / medium / Q34. Fake News
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q34. Fake News',
    'An old photograph is reposted with a new event description. What should you investigate?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Context',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search the image', 1, 1),
  ('Find earlier appearances', 2, 2),
  ('Compare dates', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [155/360] OSINT / medium / Q35. Public Email Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q35. Public Email Clue',
    'A company employee publicly lists their professional email on a company webpage. Is this considered publicly available information?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Yes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is intentionally published', 1, 1),
  ('It is on an official page', 2, 2),
  ('No private access is needed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [156/360] OSINT / medium / Q36. Review Investigation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q36. Review Investigation',
    'A restaurant has hundreds of reviews, but almost all were posted within two days. What should you investigate?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Pattern',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at dates', 1, 1),
  ('Compare review patterns', 2, 2),
  ('Think whether the activity looks natural', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [157/360] OSINT / medium / Q37. Photo + Map
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q37. Photo + Map',
    'You identify a landmark in a photo. What can you use next to determine nearby streets?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Maps',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You already know the landmark', 1, 1),
  ('Use geographic information', 2, 2),
  ('Look around the location', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [158/360] OSINT / medium / Q38. Source Reliability
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q38. Source Reliability',
    'Which is generally more reliable for an official government announcement: an anonymous social-media account or the government''s official website?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Website',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Check who published the information', 1, 1),
  ('Prefer the original source', 2, 2),
  ('Look for official domains', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [159/360] OSINT / medium / Q39. Search Result Comparison
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q39. Search Result Comparison',
    'Search A gives 100 results while Search B gives 5 highly relevant results. Which search is potentially more useful for investigation?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'Relevant',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Relevance matters', 1, 1),
  ('Quality matters', 2, 2),
  ('Don''t judge only by quantity', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [160/360] OSINT / medium / Q40. Investigator's Rule
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q40. Investigator''s Rule',
    'You have one strong clue and three weak clues pointing toward the same conclusion. Should you immediately declare the conclusion proven?',
    'OSINT',
    'medium'::difficulty_level,
    10,
    'No # 🔴',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A clue isn''t automatically proof', 1, 1),
  ('Seek independent confirmation', 2, 2),
  ('Avoid premature conclusions', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [161/360] OSINT / hard / Q41. Username + Location
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q41. Username + Location',
    'You find the same unique username on three public platforms. Platform A mentions a city, Platform B mentions a university, and Platform C shows a public event photo. What should you do before connecting all three accounts?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Verify',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare multiple independent clues', 1, 1),
  ('Check whether the dates make sense', 2, 2),
  ('Look for contradictions', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [162/360] OSINT / hard / Q42. The Old Photograph
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q42. The Old Photograph',
    'A viral post claims a photograph was taken yesterday. Reverse image searching shows the same photograph online five years ago. What is the strongest conclusion?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Misleading',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Separate image authenticity from context', 1, 1),
  ('Look at the older result', 2, 2),
  ('Compare dates', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [163/360] OSINT / hard / Q43. Three Sources
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q43. Three Sources',
    'Website A copies Website B, and Website B copied an anonymous post. Can A and B be considered two independent confirmations?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'No',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Trace the original source', 1, 1),
  ('Two copies aren''t two independent sources', 2, 2),
  ('Think about the word "independent."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [164/360] OSINT / hard / Q44. Digital Footprint
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q44. Digital Footprint',
    'A person publicly uses the same unique nickname, avatar, and personal website across several platforms. What is being created by these repeated clues?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Footprint',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about online traces', 1, 1),
  ('It is connected to identity', 2, 2),
  ('It is called a digital ______', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [165/360] OSINT / hard / Q45. Metadata Conflict
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q45. Metadata Conflict',
    'An image''s metadata says it was taken in Delhi, but visible signs clearly indicate another country. Which should you trust automatically?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Neither',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Metadata can be altered or lost', 1, 1),
  ('Visual evidence can also be misinterpreted', 2, 2),
  ('Investigate both', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [166/360] OSINT / hard / Q46. Search Narrowing
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q46. Search Narrowing',
    'You search for Apple and receive millions of results. You then search Apple "Bangalore" "2025". Why did the second search produce more focused results?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Specificity',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('More specific keywords', 1, 1),
  ('Exact phrases can help', 2, 2),
  ('Search engines use all terms', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [167/360] OSINT / hard / Q47. Hidden Context
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q47. Hidden Context',
    'A screenshot shows a message but hides the website name. The browser tab title is visible and contains a unique phrase. What could you do with the phrase?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Search',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search the exact phrase', 1, 1),
  ('Use quotation marks', 2, 2),
  ('Look for the original page', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [168/360] OSINT / hard / Q48. Location Puzzle
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q48. Location Puzzle',
    'A photo contains: - a red-and-white road sign, - a left-driving road, - a shop displaying prices in ₹. Which country is the strongest initial possibility?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'India',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('₹ represents Indian rupees', 1, 1),
  ('India drives on the left', 2, 2),
  ('Combine the clues', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [169/360] OSINT / hard / Q49. Event Verification
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q49. Event Verification',
    'A poster says an event happened on 12 March. A public video from the event is uploaded on 13 March, and an official event page lists 12 March. How many independent clues support the date?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    '2',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Count the official page', 1, 1),
  ('Count the video upload date carefully', 2, 2),
  ('Upload date isn''t necessarily event date', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [170/360] OSINT / hard / Q50. Fake Profile Detection
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q50. Fake Profile Detection',
    'A profile claims to have worked at a company since 2018, but the company''s public employee announcement shows the person joined in 2023. What should you investigate?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Timeline',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare dates', 1, 1),
  ('Find additional evidence', 2, 2),
  ('Don''t immediately label the person fraudulent', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [171/360] OSINT / hard / Q51. Source Chain
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q51. Source Chain',
    'You discover that five websites all use exactly the same unusual sentence when reporting an event. What should you investigate?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Origin',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search the exact sentence', 1, 1),
  ('Find the earliest appearance', 2, 2),
  ('Identify the original source', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [172/360] OSINT / hard / Q52. Map + Photograph
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q52. Map + Photograph',
    'A photograph shows a unique building and a street sign. You find the street on a map. What should you compare next?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Features',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the building shape', 1, 1),
  ('Compare nearby roads', 2, 2),
  ('Check whether the surroundings match', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [173/360] OSINT / hard / Q53. Account Attribution
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q53. Account Attribution',
    'Two accounts have the same username, but one is in India and the other is in Canada. Is the username alone enough to prove they belong to the same person?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'No',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Usernames can be reused', 1, 1),
  ('Look for additional clues', 2, 2),
  ('One clue is rarely enough', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [174/360] OSINT / hard / Q54. Old Website
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q54. Old Website',
    'A company''s current website no longer lists a product. You want to know whether the company previously offered it. What can you investigate?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Archive',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Search older versions', 1, 1),
  ('Use web archives', 2, 2),
  ('Compare historical dates', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [175/360] OSINT / hard / Q55. Geolocation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q55. Geolocation',
    'You have a street photograph with no obvious landmark. You notice language, road markings, architecture, vehicle plates, and shop names. What OSINT task are you performing?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Geolocation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think geography', 1, 1),
  ('You are identifying a place', 2, 2),
  ('The common OSINT term begins with "Geo."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [176/360] OSINT / hard / Q56. Information Reliability
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q56. Information Reliability',
    'Source A is an anonymous post. Source B is a dated official government document. Source C is a blog quoting Source A. Which is generally the strongest primary source?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'B',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look for the original document', 1, 1),
  ('Anonymous claims are weaker', 2, 2),
  ('A blog quoting another source is secondary', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [177/360] OSINT / hard / Q57. Contradictory Evidence
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q57. Contradictory Evidence',
    'Four clues suggest Location X, but one highly reliable official source says Location Y. What should an investigator do?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Investigate',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Consider source reliability', 1, 1),
  ('Investigate the contradiction', 2, 2),
  ('Don''t blindly follow the majority', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [178/360] OSINT / hard / Q58. Search Evolution
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q58. Search Evolution',
    'Your first search gives irrelevant results. You add a location, date, and exact phrase and get useful results. What OSINT skill are you demonstrating?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Refinement',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You changed the query', 1, 1),
  ('You made it more precise', 2, 2),
  ('Think "search ______."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [179/360] OSINT / hard / Q59. Final Verification
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q59. Final Verification',
    'You believe you have identified the location of a photograph. What is the best final step before reporting your conclusion?',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'Confirm',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Don''t stop after the first match', 1, 1),
  ('Look for another reliable source', 2, 2),
  ('Compare the evidence', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [180/360] OSINT / hard / Q60. The OSINT Principle
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Q60. The OSINT Principle',
    'Which is better OSINT practice? A. Believe the first result B. Assume matching usernames are the same person C. Collect, compare, and verify public information D. Trust viral posts',
    'OSINT',
    'hard'::difficulty_level,
    15,
    'C',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('OSINT is about investigation', 1, 1),
  ('Verification is important', 2, 2),
  ('Avoid assumptions', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [181/360] Encoding/Decoding / easy / Alphabet Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabet Shift',
    'If CAT is coded as DBU, how is DOG coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'EPH',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C → D', 1, 1),
  ('A → B', 2, 2),
  ('Apply the same rule to DOG', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [182/360] Encoding/Decoding / easy / Reverse Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse Code',
    'If CODE is coded as EDOC, how is LOGIC coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'CIGOL',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the first and last letters', 1, 1),
  ('No letter is changed', 2, 2),
  ('Reverse the complete word', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [183/360] Encoding/Decoding / easy / Alphabet Position
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabet Position',
    'If A=1, B=2, C=3..., what is the code for BAD?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '214',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('B = 2', 1, 1),
  ('A = 1', 2, 2),
  ('D = 4', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [184/360] Encoding/Decoding / easy / One Step Back
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'One Step Back',
    'If DOG is coded as CNF, how is CAT coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'BZS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D → C', 1, 1),
  ('O → N', 2, 2),
  ('Apply the same rule', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [185/360] Encoding/Decoding / easy / Opposite Alphabet
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Opposite Alphabet',
    'If A=Z, B=Y, C=X..., how is BAD coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'YZW',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A ↔ Z', 1, 1),
  ('B ↔ Y', 2, 2),
  ('D ↔ W', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [186/360] Encoding/Decoding / easy / Number Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Number Code',
    'If SUN = 19-21-14, what is the code for MOON?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '13-15-15-14',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('M = 13', 1, 1),
  ('O = 15', 2, 2),
  ('N = 14', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [187/360] Encoding/Decoding / easy / Letter Replacement
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Letter Replacement',
    'If APPLE is coded as BQQMF, how is MANGO coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'NBOHP',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A → B', 1, 1),
  ('P → Q', 2, 2),
  ('Apply it to every letter', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [188/360] Encoding/Decoding / easy / Reverse Alphabet
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse Alphabet',
    'If CAT becomes XZG, what does DOG become?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'WLT',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A becomes Z', 1, 1),
  ('D becomes W', 2, 2),
  ('G becomes T', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [189/360] Encoding/Decoding / easy / Odd Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Odd Letters',
    'If HELLO is coded as HLO, what rule is being used?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'Odd',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Number the letters from 1', 1, 1),
  ('Select positions 1, 3, 5', 2, 2),
  ('H, L, O remain', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [190/360] Encoding/Decoding / easy / Even Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Even Letters',
    'If HELLO is coded as EL, which positions are selected?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'Even',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('H = position 1', 1, 1),
  ('E = position 2', 2, 2),
  ('Select 2 and 4', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [191/360] Encoding/Decoding / easy / Swap Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Swap Letters',
    'If ABCD becomes BADC, how will WXYZ be coded?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'XWZY',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('AB → BA', 1, 1),
  ('CD → DC', 2, 2),
  ('Apply the same rule', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [192/360] Encoding/Decoding / easy / Number Pattern
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Number Pattern',
    'If A=2, B=4, C=6, D=8, what is the code for BAD?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '4-2-8',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('B is position 2', 1, 1),
  ('Multiply positions by 2', 2, 2),
  ('D is position 4', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [193/360] Encoding/Decoding / easy / Increasing Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Increasing Shift',
    'If ABC becomes BDF, what is the pattern?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '+1,+2,+3',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A → B', 1, 1),
  ('B → D', 2, 2),
  ('C → F', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [194/360] Encoding/Decoding / easy / Simple Number Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Simple Number Code',
    'If BAT = 2-1-20, what is the code for DOG?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '4-15-7',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D = 4', 1, 1),
  ('O = 15', 2, 2),
  ('G = 7', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [195/360] Encoding/Decoding / easy / Word Reversal
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Word Reversal',
    'If TABLE is coded as ELBAT, what is the code for CHAIR?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'RIAHC',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('No letter changes', 1, 1),
  ('First becomes last', 2, 2),
  ('Last becomes first', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [196/360] Encoding/Decoding / easy / Next Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Next Letter',
    'If A → C, B → D, C → E, what is DOG?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'FQI',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D → F', 1, 1),
  ('O → Q', 2, 2),
  ('G → I', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [197/360] Encoding/Decoding / easy / Previous Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Previous Letter',
    'If C → A, D → B, E → C, what is FISH?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'DGQF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('F → D', 1, 1),
  ('I → G', 2, 2),
  ('Continue the same pattern', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [198/360] Encoding/Decoding / easy / First and Last
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'First and Last',
    'If APPLE becomes EAPPL, what happened?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    'Rotation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at E', 1, 1),
  ('E was originally at the end', 2, 2),
  ('Move only the last letter', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [199/360] Encoding/Decoding / easy / Alphabetical Value
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabetical Value',
    'If A=1 and Z=26, what is the total value of BAD?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '7',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('B = 2', 1, 1),
  ('A = 1', 2, 2),
  ('D = 4', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [200/360] Encoding/Decoding / easy / Simple Pattern
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Simple Pattern',
    'If DOG is coded as 15, where D=4, O=15, G=7 and the code is based on the middle letter, what is the code for CAT?',
    'Encoding/Decoding',
    'easy'::difficulty_level,
    5,
    '1 # 🟡',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('CAT has three letters', 1, 1),
  ('Find the middle letter', 2, 2),
  ('Convert it to its alphabet position', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [201/360] Encoding/Decoding / medium / Increasing Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Increasing Shift',
    'If ABC is coded as BDF, how is DOG coded?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'EQJ',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D → E', 1, 1),
  ('O → Q', 2, 2),
  ('G → J', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [202/360] Encoding/Decoding / medium / Alternating Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alternating Shift',
    'If ABCD is coded as BADC, what happens to each pair?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'FEHG',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('AB becomes BA', 1, 1),
  ('CD becomes DC', 2, 2),
  ('Apply to EFGH', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [203/360] Encoding/Decoding / medium / Mirror + Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Mirror + Shift',
    'If A → Z, B → Y, and then one position forward is added, what is the code for BAD?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'ZAX',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('B → Y', 1, 1),
  ('Move Y one step forward', 2, 2),
  ('Do the same for A and D', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [204/360] Encoding/Decoding / medium / Position-Based Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Position-Based Shift',
    'If CAT becomes DBW, what rule is used?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '+1,+1,+3',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C → D', 1, 1),
  ('A → B', 2, 2),
  ('T → W', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [205/360] Encoding/Decoding / medium / Sum Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Sum Code',
    'If the code of a word is the sum of its letters'' positions, what is the code for DOG?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '26',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D = 4', 1, 1),
  ('O = 15', 2, 2),
  ('G = 7', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [206/360] Encoding/Decoding / medium / Reverse + Position
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse + Position',
    'If ABC becomes CBA and then each letter moves one step forward, what is the final code?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'DCB',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reverse ABC', 1, 1),
  ('You get CBA', 2, 2),
  ('Shift each letter forward once', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [207/360] Encoding/Decoding / medium / Vowel Replacement
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Vowel Replacement',
    'If every vowel is replaced by the next vowel in A-E-I-O-U, how does CAT change?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'CET',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C remains C', 1, 1),
  ('A becomes E', 2, 2),
  ('T remains T', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [208/360] Encoding/Decoding / medium / Consonant Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Consonant Shift',
    'If only consonants move one step forward and vowels remain unchanged, what is the code for CAT?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'DAU',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C → D', 1, 1),
  ('A remains A', 2, 2),
  ('T → U', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [209/360] Encoding/Decoding / medium / Alternate Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alternate Letters',
    'If COMPUTER is coded by taking letters from alternate positions starting with the first, what is the code?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'CMTR',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C = 1', 1, 1),
  ('M = 3', 2, 2),
  ('T = 5 and R = 7', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [210/360] Encoding/Decoding / medium / Pair Sum
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Pair Sum',
    'If A=1, B=2, ..., and letters are grouped in pairs, what is the code for ABCD using the sum of each pair?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '3-7',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A+B = 1+2', 1, 1),
  ('C+D = 3+4', 2, 2),
  ('Keep the two results separate', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [211/360] Encoding/Decoding / medium / Position Product
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Position Product',
    'If the code of AB is 2, because 1 × 2 = 2, what is the code of CD?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '12',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C = 3', 1, 1),
  ('D = 4', 2, 2),
  ('Multiply them', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [212/360] Encoding/Decoding / medium / Difference Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Difference Code',
    'The code of DOG is found by subtracting the first letter''s value from the last letter''s value. What is the code?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '3',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D = 4', 1, 1),
  ('G = 7', 2, 2),
  ('Calculate last − first', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [213/360] Encoding/Decoding / medium / Middle Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Middle Letter',
    'If the code of a three-letter word is the alphabet position of its middle letter, what is the code for FAN?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '1',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('F-A-N', 1, 1),
  ('A is in the middle', 2, 2),
  ('A = 1', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [214/360] Encoding/Decoding / medium / First + Last
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'First + Last',
    'If a word''s code is the sum of its first and last letters, what is the code for LOGIC?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '15',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('L = 12', 1, 1),
  ('C = 3', 2, 2),
  ('Add them', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [215/360] Encoding/Decoding / medium / Reverse Number
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse Number',
    'If DOG = 4-15-7, what is the reverse code?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '7-15-4',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Keep the numbers unchanged', 1, 1),
  ('Reverse their order', 2, 2),
  ('Last becomes first', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [216/360] Encoding/Decoding / medium / Letter-Number Conversion
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Letter-Number Conversion',
    'If A=0, B=1, C=2..., what is the code for BAD?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '1-0-3',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A = 0', 1, 1),
  ('B = 1', 2, 2),
  ('D = 3', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [217/360] Encoding/Decoding / medium / Shift by Word Length
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Shift by Word Length',
    'Every letter is shifted forward by the number of letters in the word. How is CAT coded?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'FDW',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Word length = 3', 1, 1),
  ('C → F', 2, 2),
  ('A → D', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [218/360] Encoding/Decoding / medium / Reverse and Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse and Shift',
    'Reverse DOG, then move every letter one position forward',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'HPE',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reverse DOG', 1, 1),
  ('DOG → GOD', 2, 2),
  ('Shift G,O,D forward', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [219/360] Encoding/Decoding / medium / Odd-Even Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Odd-Even Code',
    'In COMPUTER, take odd-position letters first and then even-position letters. What is the result?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    'CMTR O P U E',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Odd positions: 1,3,5,7', 1, 1),
  ('Even positions: 2,4,6,8', 2, 2),
  ('Join both groups', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [220/360] Encoding/Decoding / medium / Alphabet Mirror
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabet Mirror',
    'If A=26, B=25, C=24..., what is the code for BAD?',
    'Encoding/Decoding',
    'medium'::difficulty_level,
    10,
    '25-26-23 # 🔴',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A = 26', 1, 1),
  ('B = 25', 2, 2),
  ('D = 23', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [221/360] Encoding/Decoding / hard / Double Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Double Shift',
    'If CAT becomes ECW, each letter is shifted two positions forward. What is the code for DOG?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'FQI',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('D → F', 1, 1),
  ('O → Q', 2, 2),
  ('G → I', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [222/360] Encoding/Decoding / hard / Increasing Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Increasing Shift',
    'If ABCDE becomes BDFHJ, what is the rule?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'Increasing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A → B = +1', 1, 1),
  ('B → D = +2', 2, 2),
  ('C → F = +3', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [223/360] Encoding/Decoding / hard / Decreasing Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Decreasing Shift',
    'If ABCDE becomes FEDCB, what transformation is used?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'Reverse',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A ends up near the end', 1, 1),
  ('E becomes first', 2, 2),
  ('Read backwards', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [224/360] Encoding/Decoding / hard / Two-Step Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Two-Step Code',
    'First reverse the word, then replace every letter with its alphabet opposite. What is the code for CAT?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'GZX',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reverse CAT → TAC', 1, 1),
  ('T → G', 2, 2),
  ('A → Z and C → X', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [225/360] Encoding/Decoding / hard / Vowels +1, Consonants +2
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Vowels +1, Consonants +2',
    'Vowels move one position forward and consonants move two positions forward. What is CAT?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'EBV',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C is a consonant', 1, 1),
  ('A is a vowel', 2, 2),
  ('T is a consonant', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [226/360] Encoding/Decoding / hard / Position Multiplication
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Position Multiplication',
    'A word''s code is obtained by multiplying the alphabet position of the first and last letters. What is the code for LOGIC?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '36',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('L = 12', 1, 1),
  ('C = 3', 2, 2),
  ('Multiply', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [227/360] Encoding/Decoding / hard / Sum of All Letters
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Sum of All Letters',
    'What is the code for CODE if each letter''s alphabet value is added?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '27',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C = 3', 1, 1),
  ('O = 15', 2, 2),
  ('D = 4 and E = 5', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [228/360] Encoding/Decoding / hard / Alternating Shift
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alternating Shift',
    'In a code, odd-position letters move +1 and even-position letters move −1. How is CODE encoded?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'DNEF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C → D', 1, 1),
  ('O → N', 2, 2),
  ('D → E', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [229/360] Encoding/Decoding / hard / Reverse Pairing
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Reverse Pairing',
    'Divide ABCDEFGH into pairs and reverse every pair. What is the result?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'BADCFEHG',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('AB → BA', 1, 1),
  ('CD → DC', 2, 2),
  ('Continue', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [230/360] Encoding/Decoding / hard / Alphabet Jump
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Alphabet Jump',
    'If every letter is replaced by the letter three places ahead, what is LOGIC?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'ORJLF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('L → O', 1, 1),
  ('O → R', 2, 2),
  ('G → J', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [231/360] Encoding/Decoding / hard / Mirror + Reverse
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Mirror + Reverse',
    'Reverse DOG, then replace each letter with its opposite alphabet letter',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'TLW',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('DOG → GOD', 1, 1),
  ('G → T', 2, 2),
  ('O → L and D → W', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [232/360] Encoding/Decoding / hard / First Half / Second Half
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'First Half / Second Half',
    'If ABCDEFGH is rearranged as EFGHABCD, what operation is performed?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'Rotation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Split the word into two equal parts', 1, 1),
  ('ABCD \| EFGH', 2, 2),
  ('Swap the halves', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [233/360] Encoding/Decoding / hard / Position Sum
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Position Sum',
    'What is the code of TEAM if the code is the sum of the positions of the first two letters minus the sum of the last two?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '11',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('T=20, E=5', 1, 1),
  ('A=1, M=13', 2, 2),
  ('Calculate (20+5) − (1+13)', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [234/360] Encoding/Decoding / hard / Vowel-Consonant Count
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Vowel-Consonant Count',
    'What is the code for COMPUTER if the first digit represents the number of vowels and the second represents the number of consonants?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '3-5',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Vowels: A, E, I, O, U', 1, 1),
  ('Count vowels in COMPUTER', 2, 2),
  ('The remaining letters are consonants', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [235/360] Encoding/Decoding / hard / Repeated Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Repeated Letter',
    'What is the code for APPLE if the code is the alphabet position of the repeated letter?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '16',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look for repetition', 1, 1),
  ('One letter occurs twice', 2, 2),
  ('Convert it to its alphabet position', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [236/360] Encoding/Decoding / hard / Largest Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Largest Letter',
    'What is the code for CLOUD if the code is the alphabet position of the letter that comes latest alphabetically?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '21',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare C, L, O, U, D', 1, 1),
  ('Which comes furthest in the alphabet?', 2, 2),
  ('Convert it to a number', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [237/360] Encoding/Decoding / hard / Smallest Letter
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Smallest Letter',
    'What is the code for ZEBRA if the code is the alphabet position of the alphabetically smallest letter?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '1',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Compare Z, E, B, R, A', 1, 1),
  ('A comes before B', 2, 2),
  ('A = 1', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [238/360] Encoding/Decoding / hard / Letter Distance
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Letter Distance',
    'What is the code for AZ if the code represents the number of positions between the two letters?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    '25',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A = 1', 1, 1),
  ('Z = 26', 2, 2),
  ('Calculate the difference', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [239/360] Encoding/Decoding / hard / Three-Step Transformation
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Three-Step Transformation',
    'For CAT: first reverse it, then shift every letter +1, then reverse it again. What is the final code?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'UBD',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('CAT → TAC', 1, 1),
  ('Shift +1', 2, 2),
  ('Reverse the result', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [240/360] Encoding/Decoding / hard / The Final Logic Challenge
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Final Logic Challenge',
    'A word is encoded using this rule: reverse the word → shift every letter +1 → replace vowels with . What is the code for CODE?',
    'Encoding/Decoding',
    'hard'::difficulty_level,
    15,
    'FEP',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reverse CODE first', 1, 1),
  ('Shift each letter forward', 2, 2),
  ('Replace vowels with', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [241/360] Web Vulnerabilities / easy / Fake Login Page
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fake Login Page',
    'A person creates a fake Instagram login page and sends you the link to steal your password. What is this called?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Phishing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website looks real', 1, 1),
  ('Your password is the target', 2, 2),
  ('It starts with "P"', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [242/360] Web Vulnerabilities / easy / Password Guessing
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Password Guessing',
    'Someone keeps trying different passwords until they successfully log into an account. What is this attack called?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Bruteforce',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Many attempts are made', 1, 1),
  ('It targets login systems', 2, 2),
  ('Think about using force instead of intelligence', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [243/360] Web Vulnerabilities / easy / Weak Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Weak Password',
    'A user sets their password as 123456. What security problem does this represent?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Weakness',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The password is too simple', 1, 1),
  ('Attackers can guess it easily', 2, 2),
  ('Think "strong vs weak."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [244/360] Web Vulnerabilities / easy / Website Script
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Website Script',
    'An attacker puts harmful JavaScript into a website''s comment box, and visitors see it when they open the page. What vulnerability is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'XSS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('JavaScript is involved', 1, 1),
  ('It affects website visitors', 2, 2),
  ('Its common abbreviation has three letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [245/360] Web Vulnerabilities / easy / SQL Database
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'SQL Database',
    'A website directly places what a user types into a database query without checking it properly. What vulnerability can result?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'SQLi',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A database is involved', 1, 1),
  ('SQL is involved', 2, 2),
  ('The answer has two parts', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [246/360] Web Vulnerabilities / easy / Fake Email
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fake Email',
    'You receive an email pretending to be from your bank asking you to click a suspicious link and enter your password. What is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Phishing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Don''t trust the sender immediately', 1, 1),
  ('Your credentials are being requested', 2, 2),
  ('It is a type of social engineering', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [247/360] Web Vulnerabilities / easy / Public Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Public Password',
    'A developer accidentally uploads a file containing the website''s database password to a public repository. What security problem has occurred?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Exposure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The information should be private', 1, 1),
  ('Anyone can see it', 2, 2),
  ('Think about sensitive information becoming visible', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [248/360] Web Vulnerabilities / easy / Unlocked Account
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Unlocked Account',
    'You leave your account logged in on a public computer. Someone else opens it and uses it. What security problem allowed this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Session',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You didn''t log out', 1, 1),
  ('The next person didn''t need your password', 2, 2),
  ('Think about your login session', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [249/360] Web Vulnerabilities / easy / Unsafe Website
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Unsafe Website',
    'Which protocol should you look for when entering a password or card details on a website?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'HTTPS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the beginning of the web address', 1, 1),
  ('It has a padlock in most browsers', 2, 2),
  ('It starts with "HTTP"', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [250/360] Web Vulnerabilities / easy / Website Permission
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Website Permission',
    'A normal user somehow opens an admin-only page. What type of security problem is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Authorization',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about permissions', 1, 1),
  ('Admin has more privileges', 2, 2),
  ('"Who can access what?"', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [251/360] Web Vulnerabilities / easy / Dangerous Download
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Dangerous Download',
    'A website tricks you into downloading a harmful program disguised as a useful file. What is the file commonly called?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Malware',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It is software', 1, 1),
  ('It pretends to be something useful', 2, 2),
  ('Think "malicious software."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [252/360] Web Vulnerabilities / easy / Website Disguise
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Website Disguise',
    'A website uses a name and design very similar to a popular shopping website to fool customers. What is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Spoofing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('It looks almost real', 1, 1),
  ('The goal is to fool visitors', 2, 2),
  ('It is often connected to phishing', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [253/360] Web Vulnerabilities / easy / Too Many Requests
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Too Many Requests',
    'A user sends thousands of requests to a website in a short time, slowing it down. What type of attack is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'DoS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website becomes difficult to access', 1, 1),
  ('Many requests are sent', 2, 2),
  ('Think "denial of service."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [254/360] Web Vulnerabilities / easy / Many Computers
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Many Computers',
    'What is an attack called when many computers are used together to overwhelm a website?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'DDoS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('More than one computer', 1, 1),
  ('The website can become unavailable', 2, 2),
  ('The first letter stands for Distributed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [255/360] Web Vulnerabilities / easy / Secret Information
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Secret Information',
    'A website displays a user''s credit-card number openly on their profile. What security issue is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Exposure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think privacy', 1, 1),
  ('Financial information is sensitive', 2, 2),
  ('The information is visible when it shouldn''t be', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [256/360] Web Vulnerabilities / easy / Old Software
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Old Software',
    'A website continues using an old version of software even though a security update is available. What is the main problem?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Outdated',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Updates exist for a reason', 1, 1),
  ('Security fixes may be missing', 2, 2),
  ('Think "old vs updated."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [257/360] Web Vulnerabilities / easy / Remember Me
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Remember Me',
    'A website uses a small piece of information stored in your browser to remember that you are logged in. What is it?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Cookie',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Your browser stores it', 1, 1),
  ('Websites use it frequently', 2, 2),
  ('You can clear it from browser settings', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [258/360] Web Vulnerabilities / easy / Login Verification
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Login Verification',
    'What security feature asks for a password AND a code sent to your phone?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    '2FA',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('More than one verification method', 1, 1),
  ('Password + code', 2, 2),
  ('The answer contains a number', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [259/360] Web Vulnerabilities / easy / Human Trick
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Human Trick',
    'An attacker calls an employee pretending to be an IT technician and asks for their password. What type of attack is this?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Social-engineering',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('No hacking tool is necessarily required', 1, 1),
  ('The victim is manipulated', 2, 2),
  ('It is called human-based manipulation', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [260/360] Web Vulnerabilities / easy / Security Lock
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Security Lock',
    'What symbol in a browser usually indicates that the connection to a website is encrypted?',
    'Web Vulnerabilities',
    'easy'::difficulty_level,
    5,
    'Lock # 🟡',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look near the address bar', 1, 1),
  ('It indicates a secure connection', 2, 2),
  ('It looks like a small locked object', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [261/360] Web Vulnerabilities / medium / Changing the ID
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Changing the ID',
    'You open /profile/101, change the number to /profile/102, and suddenly see another person''s profile. What vulnerability might this indicate?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'IDOR',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You changed only a number', 1, 1),
  ('Another user''s information appeared', 2, 2),
  ('Think about access control', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [262/360] Web Vulnerabilities / medium / Unlimited Attempts
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Unlimited Attempts',
    'A login page allows you to try 10,000 passwords without blocking or slowing you down. What security control is missing?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Rate-limit',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think about limiting requests', 1, 1),
  ('It helps against password guessing', 2, 2),
  ('It controls how frequently something can happen', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [263/360] Web Vulnerabilities / medium / The Secret URL
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Secret URL',
    'An admin page is not linked anywhere on the website, but anyone can access it if they know its URL. Is hiding the URL enough security?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'No',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A secret URL isn''t a permission system', 1, 1),
  ('Anyone with the URL can enter', 2, 2),
  ('Think authorization', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [264/360] Web Vulnerabilities / medium / Login Link
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Login Link',
    'A password-reset link contains a predictable number such as reset?id=12345. Why can this be dangerous?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Predictability',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Reset links should be difficult to guess', 1, 1),
  ('Think randomness', 2, 2),
  ('Attackers should not be able to predict another user''s link', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [265/360] Web Vulnerabilities / medium / Comment Box
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Comment Box',
    'A website displays exactly what users type into a comment box without safely handling special characters. Which vulnerability could result?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'XSS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think browser', 1, 1),
  ('JavaScript may execute', 2, 2),
  ('This is a common web vulnerability', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [266/360] Web Vulnerabilities / medium / Fake Discount
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fake Discount',
    'An online store allows a user to apply the same discount coupon 100 times because the server never checks the limit. What kind of vulnerability is this?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Logic',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The code may technically work', 1, 1),
  ('The problem is with the business rule', 2, 2),
  ('Think about "how the system is supposed to work."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [267/360] Web Vulnerabilities / medium / Public File
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Public File',
    'A website accidentally makes its database backup downloadable through a public URL. What security problem is this?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Exposure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The file contains private information', 1, 1),
  ('Anyone with the link can access it', 2, 2),
  ('Think information exposure', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [268/360] Web Vulnerabilities / medium / Trusted Request
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Trusted Request',
    'You are logged into your bank. You visit another website, and that website secretly causes your browser to send a request to your bank. What attack is this?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'CSRF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('You are already logged in', 1, 1),
  ('Your browser sends the request', 2, 2),
  ('It is commonly shortened to four letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [269/360] Web Vulnerabilities / medium / Password Reuse
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Password Reuse',
    'A password leaked from one website is successfully used to log into another website. What attack takes advantage of this?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Stuffing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The password wasn''t guessed', 1, 1),
  ('It was obtained elsewhere', 2, 2),
  ('Think about using leaked credentials again', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [270/360] Web Vulnerabilities / medium / File Upload
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'File Upload',
    'A website allows users to upload profile pictures but accepts any type of file. Why can this be dangerous?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Upload',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website expected an image', 1, 1),
  ('The user can upload something else', 2, 2),
  ('Think about file validation', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [271/360] Web Vulnerabilities / medium / Error Message
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Error Message',
    'A website error reveals its database name, server location, and programming language. What security problem is this?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Disclosure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website is revealing too much', 1, 1),
  ('Developers may find the information useful', 2, 2),
  ('Attackers can also use it', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [272/360] Web Vulnerabilities / medium / Open Redirect
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Open Redirect',
    'A website has a "Continue" button that sends users to any URL supplied in the address bar. What vulnerability could this create?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Redirect',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website isn''t the final destination', 1, 1),
  ('The destination is controlled by the URL', 2, 2),
  ('Think about redirection', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [273/360] Web Vulnerabilities / medium / Website Trust
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Website Trust',
    'A website trusts everything a user enters because it assumes "users won''t enter anything harmful." What security principle is being violated?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Validation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Never blindly trust input', 1, 1),
  ('Attackers control their own input', 2, 2),
  ('Think "validation."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [274/360] Web Vulnerabilities / medium / Database Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Database Password',
    'A developer stores the database password directly inside publicly visible JavaScript code. What has been exposed?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Secret',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think confidential information', 1, 1),
  ('JavaScript runs in the user''s browser', 2, 2),
  ('Anyone can inspect client-side code', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [275/360] Web Vulnerabilities / medium / Admin Privileges
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Admin Privileges',
    'A normal employee changes "role=user" to "role=admin" in a request and becomes an administrator. What security control failed?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Authorization',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The client changed its own role', 1, 1),
  ('The server trusted the change', 2, 2),
  ('Think permissions', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [276/360] Web Vulnerabilities / medium / Secure Password Storage
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Secure Password Storage',
    'A website stores everyone''s passwords as plain readable text in its database. What is the biggest security problem?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Hashing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Passwords shouldn''t be readable', 1, 1),
  ('Think password protection', 2, 2),
  ('Hashing is commonly used', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [277/360] Web Vulnerabilities / medium / Same Password
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Same Password',
    'Why is using the same password on every website dangerous?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Reuse',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('One leak can affect many accounts', 1, 1),
  ('Think password reuse', 2, 2),
  ('Different sites should have different passwords', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [278/360] Web Vulnerabilities / medium / No Logout
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'No Logout',
    'A website''s session remains active even after the user clicks "Logout." What security area should be investigated?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Session',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think login state', 1, 1),
  ('The account remains accessible', 2, 2),
  ('Session management is involved', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [279/360] Web Vulnerabilities / medium / Unnecessary Information
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Unnecessary Information',
    'A website tells you "Username exists, but password is wrong" instead of giving the same message for both cases. What information can this reveal?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Enumeration',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The attacker learns something without logging in', 1, 1),
  ('Think user accounts', 2, 2),
  ('It is a type of information leakage', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [280/360] Web Vulnerabilities / medium / Automatic Updates
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Automatic Updates',
    'A website uses a third-party library that has a known security flaw but the developer never updates it. What is the main weakness?',
    'Web Vulnerabilities',
    'medium'::difficulty_level,
    10,
    'Dependency # 🔴',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The problem comes from another package', 1, 1),
  ('Updates are available', 2, 2),
  ('Think software dependency', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [281/360] Web Vulnerabilities / hard / The Free Product
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Free Product',
    'An online store lets users change the product price in their browser from ₹5,000 to ₹5 before submitting the order. The server accepts ₹5. What failed?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Validation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The browser should not decide the final price', 1, 1),
  ('The server should verify important values', 2, 2),
  ('Think about business rules', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [282/360] Web Vulnerabilities / hard / The Hidden Admin
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Hidden Admin',
    'A normal user changes /user/dashboard to /admin/dashboard and gains access. What security problem is demonstrated?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Authorization',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The user is authenticated', 1, 1),
  ('Authentication isn''t the same as permission', 2, 2),
  ('Think access control', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [283/360] Web Vulnerabilities / hard / The Unlimited Coupon
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Unlimited Coupon',
    'A coupon should work once per customer, but refreshing the page allows it to be applied repeatedly. What type of vulnerability is this?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Logic',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The application itself is functioning', 1, 1),
  ('The rule is being bypassed', 2, 2),
  ('Think business rules', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [284/360] Web Vulnerabilities / hard / The Changed Account
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Changed Account',
    'A website uses /account?id=500. Changing 500 to 501 displays another user''s private account. What is the vulnerability?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'IDOR',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('An ID is being changed', 1, 1),
  ('Private information appears', 2, 2),
  ('You may have seen this abbreviation before', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [285/360] Web Vulnerabilities / hard / The Helpful Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Helpful Error',
    'A login page responds differently when the username exists versus when it doesn''t. What can an attacker perform using this difference?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Enumeration',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The attacker doesn''t need the password', 1, 1),
  ('They are discovering accounts', 2, 2),
  ('Think information gathering', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [286/360] Web Vulnerabilities / hard / The Fake Reset
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Fake Reset',
    'A password-reset token is always username123. Why is this dangerous?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Predictability',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Password recovery is involved', 1, 1),
  ('The token can be guessed', 2, 2),
  ('Think randomness', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [287/360] Web Vulnerabilities / hard / The Open Door API
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Open Door API',
    'An API returns private customer information whenever someone provides a customer ID, without checking who is making the request. What is missing?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Authorization',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The API knows the ID', 1, 1),
  ('It doesn''t check the user''s permission', 2, 2),
  ('Think access control', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [288/360] Web Vulnerabilities / hard / The Trusted Browser
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Trusted Browser',
    'A website accepts a request simply because it comes from a logged-in user''s browser, even though another website caused the request. What vulnerability could occur?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'CSRF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The victim is logged in', 1, 1),
  ('Another website triggers the request', 2, 2),
  ('Four-letter abbreviation', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [289/360] Web Vulnerabilities / hard / The Comment Attack
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Comment Attack',
    'A user posts <script> in a comment and the code runs whenever someone views the comment. What vulnerability is this?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'XSS',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('JavaScript', 1, 1),
  ('Browser', 2, 2),
  ('Three-letter abbreviation', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [290/360] Web Vulnerabilities / hard / The Database Trick
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Database Trick',
    'A login form builds a database query directly using the username typed by the user. What vulnerability should the developer worry about?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'SQLi',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('SQL is involved', 1, 1),
  ('The database is the target', 2, 2),
  ('Think "injection."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [291/360] Web Vulnerabilities / hard / The Server's Request
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Server''s Request',
    'A website asks users for a URL and then fetches that URL from its own server. Why could this become dangerous?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'SSRF',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The server makes the request', 1, 1),
  ('Internal resources could be involved', 2, 2),
  ('The abbreviation contains four letters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [292/360] Web Vulnerabilities / hard / The Fake Destination
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Fake Destination',
    'A trusted website redirects users to any website specified by a URL parameter. Why could attackers abuse this?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Redirect',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The first website may be legitimate', 1, 1),
  ('The final website is controlled by the attacker', 2, 2),
  ('Think redirection', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [293/360] Web Vulnerabilities / hard / The Unlimited Login
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Unlimited Login',
    'An attacker can make thousands of login attempts per second because the website has no restriction on request frequency. What protection is missing?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Rate-limit',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Think speed', 1, 1),
  ('Too many requests', 2, 2),
  ('It is called limiting the request rate', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [294/360] Web Vulnerabilities / hard / The Password Database
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Password Database',
    'A hacker steals a database containing passwords stored in a form that can be read immediately. What protection should have been used?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Hashing',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Passwords should not be reversible', 1, 1),
  ('Think one-way transformation', 2, 2),
  ('Modern applications use password hashing algorithms', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [295/360] Web Vulnerabilities / hard / The Public Backup
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Public Backup',
    'A developer accidentally uploads database_backup.zip to the website''s public folder. What vulnerability could this create?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Exposure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Backups can contain lots of information', 1, 1),
  ('The file is publicly accessible', 2, 2),
  ('Think information being exposed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [296/360] Web Vulnerabilities / hard / The Dangerous Upload
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Dangerous Upload',
    'A profile-picture page accepts .jpg, .png, .exe, and .html files without checking them. What security weakness does this demonstrate?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Validation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The website expected images', 1, 1),
  ('Other file types are accepted', 2, 2),
  ('Think about checking user-uploaded files', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [297/360] Web Vulnerabilities / hard / The Old Library
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Old Library',
    'A website uses an outdated library with a publicly known security flaw. What should the developer do first?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Update',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A newer version exists', 1, 1),
  ('The vulnerability is already known', 2, 2),
  ('Think software maintenance', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [298/360] Web Vulnerabilities / hard / The Password in URL
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Password in URL',
    'A website sends a user''s password as part of the URL, such as example.com/login?password=12345. Why is this unsafe?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Exposure',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('URLs are often recorded', 1, 1),
  ('Passwords are sensitive', 2, 2),
  ('Think information exposure', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [299/360] Web Vulnerabilities / hard / The Admin Cookie
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Admin Cookie',
    'A website stores an administrator''s session information in a cookie that can be accessed by JavaScript. Why could this be dangerous if XSS exists?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'HttpOnly',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('XSS is involved', 1, 1),
  ('Cookies can contain session information', 2, 2),
  ('Think about protecting cookies from JavaScript', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [300/360] Web Vulnerabilities / hard / The Biggest Clue
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'The Biggest Clue',
    'A website accepts user input, trusts it completely, and directly uses it in HTML, database queries, commands, and file paths. What general security principle should developers follow?',
    'Web Vulnerabilities',
    'hard'::difficulty_level,
    15,
    'Validation',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Never blindly trust users', 1, 1),
  ('Check data before using it', 2, 2),
  ('Think "trust but verify."', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [301/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    '#include <stdio.h>

int main() {
int a = 10;
int b = 5;

printf("%d", a + b);

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '15',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('a contains 10', 1, 1),
  ('b contains 5', 2, 2),
  ('The + operator is used', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [302/360] C Coding / easy / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    '#include <stdio.h>

int main() {
int age = 20;
printf("%d", age)
return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'printf',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the printf', 1, 1),
  ('C statements need something at the end', 2, 2),
  ('Check the punctuation', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [303/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 5;

printf("%d", x * 2);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '10',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x = 5', 1, 1),
  ('Multiplication is performed', 2, 2),
  ('5 × 2', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [304/360] C Coding / easy / Fix the Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fix the Code',
    '#include <stdio.h>

int main() {
int a = 10
printf("%d", a);

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    ';',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the variable declaration', 1, 1),
  ('C statements need punctuation', 2, 2),
  ('It is the same symbol used after printf()', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [305/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

if (x > 5)
printf("Yes");
else
printf("No");',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'Yes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Is 10 greater than 5?', 1, 1),
  ('The if condition is checked first', 2, 2),
  ('Only one branch executes', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [306/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int i;

for(i = 1; i <= 3; i++)
printf("%d ", i);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '1 2 3',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The loop starts at 1', 1, 1),
  ('It stops after 3', 2, 2),
  ('Look at i++', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [307/360] C Coding / easy / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    '#include <stdio.h>

int main() {
int a;
scanf("%d", a);

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '&',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('scanf() needs the address of the variable', 1, 1),
  ('Think about &', 2, 2),
  ('Compare scanf() with printf()', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [308/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;
int b = 2;

printf("%d", a / b);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '2',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Both variables are integers', 1, 1),
  ('The decimal part is discarded', 2, 2),
  ('5 / 2', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [309/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 5;

x++;

printf("%d", x);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '6',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('++ increases a value', 1, 1),
  ('x starts at 5', 2, 2),
  ('It increases once', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [310/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'char ch = ''A'';

printf("%c", ch);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'A',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('ch stores a character', 1, 1),
  ('%c is used for characters', 2, 2),
  ('Look at the value assigned to ch', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [311/360] C Coding / easy / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    '#include <stdio.h>

int main() {
int 2value = 10;

printf("%d", 2value);

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'Identifier',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the first character', 1, 1),
  ('Variable names have rules', 2, 2),
  ('Can an identifier start with a number?', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [312/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

if (x == 10)
printf("Correct");',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'Correct',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('== compares values', 1, 1),
  ('Is x equal to 10?', 2, 2),
  ('The condition is true', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [313/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

if (x = 5)
printf("A");
else
printf("B");',
    'C Coding',
    'easy'::difficulty_level,
    5,
    'A',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('= is assignment', 1, 1),
  ('5 is assigned to x', 2, 2),
  ('In C, non-zero values are true', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [314/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 3;
int b = 4;

printf("%d", a > b);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '0',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Is 3 greater than 4?', 1, 1),
  ('Comparisons produce 0 or 1', 2, 2),
  ('False corresponds to 0', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [315/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

printf("%d", x % 3);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '1',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('\% means remainder', 1, 1),
  ('Divide 10 by 3', 2, 2),
  ('What remains?', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [316/360] C Coding / easy / Fix the Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fix the Code',
    '#include <stdio.h>

int main() {
printf("Hello World")

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    ';',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Check the end of the statement', 1, 1),
  ('printf() itself is correct', 2, 2),
  ('C statements need termination', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [317/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;
int b = 10;

int temp = a;
a = b;
b = temp;

printf("%d %d", a, b);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '10 5',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('temp temporarily stores a', 1, 1),
  ('a receives b', 2, 2),
  ('b receives the old a', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [318/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int i = 0;

while(i < 3) {
printf("%d ", i);
i++;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '0 1 2',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Start with 0', 1, 1),
  ('Stop when i becomes 3', 2, 2),
  ('i++ increases it', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [319/360] C Coding / easy / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int marks = 90;

printf("%f", marks);

return 0;
}',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '%d',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('marks is an integer', 1, 1),
  ('%f is for floating-point values', 2, 2),
  ('Think %d', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [320/360] C Coding / easy / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'char ch = ''B'';

printf("%d", ch);',
    'C Coding',
    'easy'::difficulty_level,
    5,
    '66 # 🟡',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Characters have numeric codes', 1, 1),
  ('C stores characters internally as integers', 2, 2),
  ('Think ASCII', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [321/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;

printf("%d", ++a);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '6',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('++a is pre-increment', 1, 1),
  ('Increment happens first', 2, 2),
  ('Then the value is printed', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [322/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;

printf("%d", a++);
printf("%d", a);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '56',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('a++ uses the old value first', 1, 1),
  ('Then a increases', 2, 2),
  ('The second printf sees the new value', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [323/360] C Coding / medium / Find the Bug
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Bug',
    'int x = 10;

if(x = 20)
printf("True");',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '==',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('= assigns', 1, 1),
  ('== compares', 2, 2),
  ('The intended operation is comparison', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [324/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 10;
int b = 20;

if(a < b && b > 15)
printf("Yes");
else
printf("No");',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Yes',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('10 < 20 is true', 1, 1),
  ('20 > 15 is true', 2, 2),
  ('&& requires both to be true', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [325/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;

if(a > 0 \|\| a < -10)
printf("True");
else
printf("False");',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'True',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('\|\| means OR', 1, 1),
  ('Only one condition needs to be true', 2, 2),
  ('5 > 0', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [326/360] C Coding / medium / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int arr[5];

arr[5] = 10;',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Overflow',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Array indexing starts at 0', 1, 1),
  ('Five elements have indices 0--4', 2, 2),
  ('Index 5 is outside the array', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [327/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int arr[] = {10, 20, 30, 40};

printf("%d", arr[2]);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '30',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Index starts at 0', 1, 1),
  ('arr[0] = 10', 2, 2),
  ('Find arr[2]', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [328/360] C Coding / medium / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int arr[3] = {1, 2, 3, 4};',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Overflow',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The array size is 3', 1, 1),
  ('How many values are provided?', 2, 2),
  ('There are too many initializers', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [329/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 5;

for(int i = 0; i < x; i++)
printf("*");',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '5',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('i starts at 0', 1, 1),
  ('It stops before 5', 2, 2),
  ('Count the iterations', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [330/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int sum = 0;

for(int i = 1; i <= 5; i++)
sum += i;

printf("%d", sum);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '15',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Add 1 through 5', 1, 1),
  ('sum += i', 2, 2),
  ('Think 1+2+3+4+5', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [331/360] C Coding / medium / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int *p;

*p = 10;

return 0;
}',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Pointer',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p is a pointer', 1, 1),
  ('Has it been given a valid address?', 2, 2),
  ('You cannot safely dereference an uninitialized pointer', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [332/360] C Coding / medium / Fix the Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fix the Code',
    'int x = 10;
int *p;

p = x;',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '&x',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('A pointer stores an address', 1, 1),
  ('Use the address-of operator', 2, 2),
  ('It is &', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [333/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;
int *p = &x;

printf("%d", *p);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '10',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p stores the address', 1, 1),
  ('p accesses the value', 2, 2),
  ('x is 10', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [334/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'void change(int x) {
x = 20;
}

int main() {
int a = 10;

change(a);

printf("%d", a);
}',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '10',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C normally passes arguments by value', 1, 1),
  ('The function receives a copy', 2, 2),
  ('The original a remains unchanged', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [335/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'void change(int *x) {
*x = 20;
}

int main() {
int a = 10;

change(&a);

printf("%d", a);
}',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '20',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The address of a is passed', 1, 1),
  ('x changes the original variable', 2, 2),
  ('a becomes 20', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [336/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'char str[] = "Hello";

printf("%c", str[1]);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'e',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Strings are character arrays', 1, 1),
  ('Index starts at 0', 2, 2),
  ('str[0] is H', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [337/360] C Coding / medium / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'char str[5] = "Hello";',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Null',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('"Hello" has five visible characters', 1, 1),
  ('C strings need a special ending character', 2, 2),
  ('Count the required space', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [338/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

{
int x = 20;
printf("%d ", x);
}

printf("%d", x);',
    'C Coding',
    'medium'::difficulty_level,
    10,
    '20 10',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('There are two variables named x', 1, 1),
  ('One is inside a block', 2, 2),
  ('Scope matters', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [339/360] C Coding / medium / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 5;

if(x)
printf("A");
else
printf("B");',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'A',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('C treats non-zero values as true', 1, 1),
  ('x = 5', 2, 2),
  ('5 is non-zero', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [340/360] C Coding / medium / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int a = 10;
int b = 0;

printf("%d", a / b);

return 0;
}',
    'C Coding',
    'medium'::difficulty_level,
    10,
    'Division # 🔴',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the denominator', 1, 1),
  ('b is zero', 2, 2),
  ('Division by zero is invalid', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [341/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 5;

printf("%d %d", a++, ++a);',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Undefined',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('a is modified more than once', 1, 1),
  ('Both operations happen in one expression', 2, 2),
  ('Think about undefined behavior', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [342/360] C Coding / hard / Find the Bug
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Bug',
    'int arr[5];

for(int i = 0; i <= 5; i++)
arr[i] = i;',
    'C Coding',
    'hard'::difficulty_level,
    15,
    '<',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Array indices are 0--4', 1, 1),
  ('The loop reaches 5', 2, 2),
  ('Look at <=', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [343/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a = 10;
int *p = &a;

*p = 25;

printf("%d", a);',
    'C Coding',
    'hard'::difficulty_level,
    15,
    '25',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p points to a', 1, 1),
  ('p means the value at that address', 2, 2),
  ('Changing it changes a', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [344/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int *p;
int x = 10;

*p = x;',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Uninitialized',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p has no valid address', 1, 1),
  ('x is being assigned to the pointed location', 2, 2),
  ('A pointer must point somewhere valid first', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [345/360] C Coding / hard / Fix the Code
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Fix the Code',
    'int x = 10;
int *p;

*p = 20;',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'p=&x',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p needs an address', 1, 1),
  ('Make it point to x', 2, 2),
  ('Use &', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [346/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'void fun(int *p) {
*p = *p + 10;
}

int main() {
int x = 5;

fun(&x);

printf("%d", x);
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    '15',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x starts at 5', 1, 1),
  ('The address is passed', 2, 2),
  ('10 is added to the original value', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [347/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    '#include <stdio.h>

int main() {
int *p = NULL;

printf("%d", *p);

return 0;
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Dereference',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('NULL means no valid object is being pointed to', 1, 1),
  ('p attempts to access a value', 2, 2),
  ('You cannot safely dereference NULL', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [348/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

if(x > 5)
if(x > 15)
printf("A");
else
printf("B");',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'B',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('First condition is true', 1, 1),
  ('Then x > 15 is checked', 2, 2),
  ('The else belongs to the nearest unmatched if', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [349/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int x = 10;

printf("%d", x);

return 0;
}

printf("Hello");',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Scope',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at where it appears', 1, 1),
  ('The function has already ended', 2, 2),
  ('Executable statements normally belong inside functions', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [350/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int a[] = {10, 20, 30};

int *p = a;

printf("%d", *(p + 1));',
    'C Coding',
    'hard'::difficulty_level,
    15,
    '20',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p points to the first element', 1, 1),
  ('p + 1 points to the second', 2, 2),
  ('Dereference it', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [351/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'char *str = "Hello";

str[0] = ''Y'';',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Literal',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('str points to a string literal', 1, 1),
  ('String literals should not be modified', 2, 2),
  ('Think read-only memory', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [352/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 5;

printf("%d", sizeof(x));',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'sizeof',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x is an integer', 1, 1),
  ('sizeof gives size in bytes', 2, 2),
  ('The exact number depends on the system', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [353/360] C Coding / hard / Find the Bug
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Bug',
    'int sum(int a, int b) {
return a + b;
}

int main() {
printf("%d", sum(5));
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Argument',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look at the function definition', 1, 1),
  ('How many arguments does it require?', 2, 2),
  ('Only one was provided', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [354/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

int *p = &x;
int **q = &p;

printf("%d", **q);',
    'C Coding',
    'hard'::difficulty_level,
    15,
    '10',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('q points to p', 1, 1),
  ('p points to x', 2, 2),
  ('Two dereferences reach x', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [355/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int *p;

{
int x = 10;
p = &x;
}

printf("%d", *p);
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Dangling',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x exists only inside the block', 1, 1),
  ('What happens when the block ends?', 2, 2),
  ('The pointer refers to an object whose lifetime has ended', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [356/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

switch(x) {
case 5:
printf("A");
break;

case 10:
printf("B");
break;

default:
printf("C");
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'B',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x is 10', 1, 1),
  ('Match the correct case', 2, 2),
  ('break stops execution', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [357/360] C Coding / hard / Find the Bug
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Bug',
    'int x = 1;

while(x <= 5) {
printf("%d ", x);
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Infinite',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('Look inside the loop', 1, 1),
  ('What changes x?', 2, 2),
  ('The condition always remains true', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [358/360] C Coding / hard / Find the Output
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Output',
    'int x = 10;

int *p = &x;

printf("%p", (void*)p);',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Address',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('p stores an address', 1, 1),
  ('%p is used for pointers', 2, 2),
  ('The actual address varies', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [359/360] C Coding / hard / Find the Error
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Error',
    'int main() {
int x;

printf("%d", x);

return 0;
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Uninitialized',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('x was declared', 1, 1),
  ('Was it given a value?', 2, 2),
  ('Local variables aren''t automatically initialized to zero', 3, 3)
) AS v(hint_text, point_cost, order_index);

-- [360/360] C Coding / hard / Find the Bug
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Find the Bug',
    '#include <stdio.h>

int factorial(int n) {
return n * factorial(n - 1);
}

int main() {
printf("%d", factorial(5));
}',
    'C Coding',
    'hard'::difficulty_level,
    15,
    'Recursion',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
  ('The function calls itself', 1, 1),
  ('What stops the recursion?', 2, 2),
  ('There is no stopping condition', 3, 3)
) AS v(hint_text, point_cost, order_index);
