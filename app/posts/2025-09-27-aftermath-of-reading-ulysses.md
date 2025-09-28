---
layout: post
title:  "Aftermath of reading Ulysses"
date:   2025-09-27 20:31:32 +0000
categories: James Joyce, Ulysses, Cursor 
description: An explanation of why I published an abridged Ulysses
permalink: /aftermath_of_reading_ulysses/
---

## What is this?

This document provides detailed technical documentation and methodology for the creation of [An Abridged James Joyce Ulysses](/posts/abridged-ulysses/), a condensed version of Joyce's masterpiece that extracts only the dialogue and essential setting information. The abridged text reduces the original 265,000+ word novel to approximately 15,000 words while preserving the narrative structure and character interactions that drive the story forward.

This technical documentation was created by Everardo with assistance from AI tools to systematically document the complex text processing methodology, technical implementation details, and quality control measures employed in transforming Joyce's dense literary work into an accessible dialogue-focused format. The documentation serves as both a record of the abridgement process and a guide for similar literary text analysis projects.

It's completely clear that the stream of consciousness bits in Ulysses are actually the best bits. This is an exercise to help me familiarise with the text and to help other readers understand parts which can sometimes get lost. I've enjoyed Ulysses more because of this effort and it has helped me understand characters in a different way.

## Background

My copy of Ulysses was purchased in Hughes & Hughes at Dublin's airport in 2008 after my European grand tour. I had a 36 hour layover and with little money and the voracious appetite for entertainment that so commonly accompanies a student the € 13.50 euros seemed like the best possible investment, even chosen over nourishment. Not only did Ulysses provide entertainment during that long layover, but its complex reading was to last for several other trips. I finally finished it in 2025, concluding that those € 13.50 Euros gave me conversation, knowledge and reading for a bit over 17 years, a great investment.

During that trip (first time in Europe) I wanted to prepare myself for Ulysses (why? I don't know), and so acquired Dubliners and Portrait of the Artist as a Young Man, both read by recommendation of Emma, an Irish friend I made during my first week there. I can say now that it was not sufficient preparation.

After about 4 years of being my official travel book, only going with me to the most distant places since it really wasn't enjoyable to carry daily, I left the book in the middle of Circe more or less in 2012 after a near deatch experience. It was a challenging book to read, and even though I did my best I really was too young and green-footed to grasp many of the subtler things about it. When I took it back, on a plane to London in 2025 I found myself in the middle of one of the most exciting and meaningful chapters of the book (Circe)! I was quite literally unable to put it down. How did I ever stop the book there?

Circe is filled with hallucinations about death and dead people, it is as they say, just my cup of tea especially after the circumstance under which I dropped the reading. However, because of the long (10+ year) gap in between my reading sessions I was having trouble following the book and wanted some help in understanding the basic story. **That's how and why the idea for the abridged version came about.**

As I learned in the foreword on my edition (Penguin Modern Classics edition, 1960 Bodley Head version printed in 2000) there are many companion books and guides for Ulysses, but I couldn't find anything similar, that would concentrate just on the dialog of the story, giving a quick-ish idea of what Stephen and Leopold are up to during that day.

In this document, I will share how I got the end result that you can see here [An Abridged James Joyce Ulysses](/posts/abridged-ulysses/) and hopefully some of you may use this to your advantage or just enjoy the ride.

## Methodology

### Text Processing and Dialogue Extraction

The abridgement process employed a systematic three-phase approach to extract and format dialogue from James Joyce's *Ulysses*. The methodology was designed to preserve the narrative structure while focusing specifically on conversational elements that drive character development and plot progression.

**Phase 1: Analysis and Planning**
- Comprehensive review of the source text structure and dialogue patterns
- Identification of unique chapter formats requiring specialized extraction techniques
- Development of consistent formatting protocols for speaker attribution and dialogue presentation

**Phase 2: Incremental Implementation**
- Systematic processing of each chapter in 10-15 line segments
- Direct parsing of the original Project Gutenberg text (`ulysses.txt`) for chapters with non-standard dialogue formats
- Specialized handling for chapters 14 ("Oxen of the Sun"), 15 ("Circe"), 17 ("Ithaca"), and 18 ("Penelope") due to their unique narrative structures

**Phase 3: Quality Control and Formatting**
- Verification of dialogue accuracy against source material
- Implementation of consistent markdown formatting with speaker attribution
- Creation of navigational elements including table of contents and cross-references

### Technical Implementation

The abridgement was implemented within a Ruby on Rails application using Redcarpet markdown rendering. Key technical components included:

- **Markdown Processing**: Configuration of Redcarpet renderer with `with_toc_data: true` and `header_ids: true` to enable anchor link generation
- **CSS Styling**: Implementation of chapter-specific color schemes using CSS sibling selectors (`+ *`, `~ *`) to apply full-width background colors while maintaining text centering
- **Navigation System**: Creation of bidirectional hyperlinks between table of contents and individual chapters using markdown anchor syntax
- **Gilbert's Schema Integration**: Implementation of an interactive table mapping Joyce's structural elements (Title, Scene, Hour, Organ, Art, Colour, Symbol, Technic) with chapter-specific color coding

### Compliance and Attribution

The project maintains full compliance with Project Gutenberg licensing requirements, including proper attribution, license links, and acknowledgment of the public domain status of the source material. The derivative work is provided for educational purposes under the same permissive terms as the original Project Gutenberg edition.

### Data Sources

- Primary source: Project Gutenberg eBook of *Ulysses* (public domain, copy available [here:](https://github.com/ebarojas/ror.climb.mx/blob/main/resources/ulysses.txt) )
- Reference material: [*Ulysses Dialog Compendium*](https://github.com/ebarojas/ror.climb.mx/blob/main/resources/Ulysses_Dialog_Compendium.md) for standard dialogue chapters. This file was generated through systematic text extraction using grep pattern matching to identify and isolate lines containing dialogue markers (em-dashes —, en-dashes –, and hyphens -) followed by systematic parsing to separate dialogue content from narrative text.

### Technical Documentation

The complete methodology and technical implementation details for this abridgement project are documented in the [Cursor Instructions Document](https://github.com/ebarojas/ror.climb.mx/blob/main/resources/Cursor_instructions.md). This document provides:

- **Structured Chapter-by-Chapter Strategy**: Detailed approach for processing each chapter of Ulysses
- **Technical Constraints & Solutions**: Handling of tool limitations and token management
- **Execution Protocol**: Step-by-step methodology for dialogue extraction and attribution
- **Quality Control Measures**: Verification processes and formatting standards
- **Special Handling Instructions**: Protocols for chapters with non-standard dialogue formats

The documentation serves as both a technical reference and a guide for future similar text processing projects, demonstrating systematic approaches to large-scale literary text analysis and transformation.

### Complement of colour described in Gilbert's table

Stuart Gilbert's original table provided symbolic correspondences for each chapter of *Ulysses*, including suggested colors for many episodes. However, several chapters lacked color specifications in Gilbert's schema. To create a cohesive visual experience throughout the abridged text, I sought to define appropriate colors for these missing chapters, ensuring each episode had a distinct visual identity that complemented both Gilbert's existing color scheme and the thematic content of each chapter.

The color selection process involved analyzing each chapter's setting, mood, and symbolic elements to determine colors that would provide an intuitive visual guide for readers navigating the complex structure of Joyce's work. The resulting color palette maintains consistency with Gilbert's original vision while extending the visual framework to encompass all eighteen episodes of the novel.

Colours that are originally proposed by Gilbert are identified with an (o).

| #  | Episode            | Background    | Hex       | Text        | Hex       | Reasoning                                               |
| -- | ------------------ | ------------- | --------- | ----------- | --------- | ------------------------------------------------------- |
| 1  | Telemachus         | White (o)        | `#FFFFFF` | Gold (o)       | `#FFD700` | Dawn, youth, purity; opening brightness.                |
| 2  | Nestor             | Brown (o)   | `#8B4513` | Ivory       | `#FFFFF0` | Dusty classroom, money, sediment of history.            |
| 3  | Proteus            | Green (o)     | `#2E8B57` | Light Cyan  | `#E0FFFF` | Shifting shoreline, fluid thought, water.               |
| 4  | Calypso            | Orange (o)  | `#FF8C00` | Navy        | `#000080` | Domestic sensuality, hearth, Mediterranean warmth.      |
| 5  | Lotus Eaters       | Amber Gold    | `#DAA520` | Indigo      | `#4B0082` | Narcotic haze, incense, 10 a.m., Eucharistic undertone. |
| 6  | Hades              | Black (o)     | `#000000` | White (o)       | `#FFFFFF` | Death and mourning; stark polarities.                   |
| 7  | Aeolus             | Red (o)     | `#B22222` | White       | `#FFFFFF` | Rhetoric, hot air, headlines and print.                 |
| 8  | Lestrygonians      | Apricot       | `#FFB347` | Dark Brown  | `#5C4033` | Hunger, taverns, the warmth of food.                    |
| 9  | Scylla & Charybdis | Charcoal      | `#333333` | Scarlet     | `#FF2400` | Library dialectic; critical fire in shadow.             |
| 10 | Wandering Rocks    | Blue (o)    | `#6A5ACD` | Grey (o)   | `#D3D3D3` | Fragmented, prismatic Dublin; multiplicity.             |
| 11 | Sirens             | Bronze        | `#CD7F32` | White (o)       | `#FFFDD0` | Musical resonance, barroom metallic shimmer.            |
| 12 | Cyclops            | Emerald Green | `#006400` | Black       | `#000000` | Nationalist ferocity, parodic bite.                     |
| 13 | Nausicaa           | Twilight Blue | `#4682B4` | Light Grey  | `#B0C4DE` | Evening beach, innocence tinged with sentiment.         |
| 14 | Oxen of the Sun    | Ivory White   | `#FFFFF0` | Crimson     | `#DC143C` | Birth, sterility vs vitality; blood and maternity.      |
| 15 | Circe              | Deep Purple   | `#800080` | Acid Green  | `#ADFF2F` | Hallucination, delirium, theatrical excess.             |
| 16 | Eumaeus            | Muddy Brown   | `#654321` | Pale Yellow | `#FFFF99` | Late-night fatigue; tavern lamp glow.                   |
| 17 | Ithaca             | Steel Grey    | `#C0C0C0` | Black       | `#000000` | Catechismal clarity; scientific formality.              |
| 18 | Penelope           | Maroon        | `#800000` | Ivory       | `#FFFFF0` | Passion, flesh, nocturnal intimacy and assent.          |
